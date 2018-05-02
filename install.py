import sys
import os
from yaml import load
from os.path import abspath, expanduser
import getopt


installer = {"archlinux": "pacman -S",
             "debian": "apt install"}


def getInfo(name):
    with open(name, 'r') as f:
        data = load(f)
    return data


def getOS():
    if not os.path.isfile("/etc/os-release"):
        print("Linux Distro not detected")

    with open("/etc/os-release") as release:
        release_cont = release.read()

    if "ID=arch" in release_cont:
        return "archlinux"


def runCmd(cmd, dryRun):
    print(cmd)
    if not dryRun:
        os.system(cmd)


def install(info, arch, dryRun):
    directory = "./" + info['name'] + "/"
    runCmd("mkdir " + directory + "old 2> /dev/null", dryRun)

    if 'depends' in info:
        precmd = "sudo " + installer[arch] + " "
        if arch in info['depends']:
            if type(info['depends'][arch]) == list:
                pkgs = ' '.join(info['depends'][arch])
            else:
                pkgs = info['depends'][arch]

        if type(info['depends']['default']) == list:
            pkgs = ' '.join(info['depends']['default'])
        else:
            pkgs = info['depends']['default']

        runCmd(precmd + pkgs, dryRun)

    if 'preconf_hook' in info:
        for i in info['preconf_hook']:
            cmd = "sh " + directory + i
            runCmd(cmd, dryRun)

    if 'files' in info:
        files = info['files']
        for i in files.keys():
            origin = directory + i
            target = files[i]
            for j in target:
                if os.path.isfile(expanduser(j)):
                    cmd = "mv -f " + expanduser(j) + " " + abspath(directory + "old")
                    runCmd(cmd, dryRun)
                cmd = "ln " + abspath(origin) + " " + expanduser(j)
                runCmd(cmd, dryRun)

    if 'folders' in info:
        folders = info['folders']
        for i in folders.keys():
            origin = directory + i
            target = folders[i]
            for j in target:
                if os.path.isdir(expanduser(j)):
                    cmd = "mv -f " + expanduser(j) + " " + abspath(directory + "old/")
                    runCmd(cmd, dryRun)
                if os.path.islink(expanduser(j)):
                    cmd = "rm " + expanduser(j)
                    runCmd(cmd, dryRun)
                cmd = "ln -s " + abspath(origin) + " " + expanduser(j)
                runCmd(cmd, dryRun)

    if 'postconf_hook' in info:
        for i in info['postconf_hook']:
            cmd = "bash " + directory + i
            runCmd(cmd, dryRun)


if __name__ == "__main__":
    data = getInfo('config.yml')
    dryRun = False
    programs = []
    arch = ""

    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:],
                                       "dp:a:",
                                       ["dryRun", "program=", "arch="])
    except getopt.GetoptError:
        print("usage: -d [--dryRun]: dont really copy\n -p [--program] prog: install program")
        sys.exit()

    for opt, arg in opts:
        if opt in ("-d", "--dryRun"):
            dryRun = True
        elif opt in ("-p", "--program"):
            programs.append(arg)
        if opt in ("-a", "--arch"):
            arch = arg
        else:
            arch = getOS()

    for i in data:
        if i['name'] in programs or 'all' in programs:
            install(i, arch, dryRun)
