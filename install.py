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


def install(info, arch, target, dryRun):
    if 'preconf_hook' in info:
        for i in info['preconf_hook']:
            cmd = "sh " + "scripts/" + i
            runCmd(cmd, dryRun)

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

    cmd = "stow -t " + target + " " + info['name']
    runCmd(cmd, dryRun)


    if 'postconf_hook' in info:
        for i in info['postconf_hook']:
            cmd = "sh " + "scripts/" + i
            runCmd(cmd, dryRun)


if __name__ == "__main__":
    data = getInfo('config.yml')
    dryRun = False
    programs = []
    arch = ""
    target = expanduser("~")

    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:],
                                       "dp:a:t:",
                                       ["dryRun", "program=", "arch=", "target="])
    except getopt.GetoptError:
        print("usage: -d [--dryRun]: dont really copy\n -p [--program] prog: install program\n -t [--target] dir: where to install [default = ~]")
        sys.exit()

    for opt, arg in opts:
        if opt in ("-d", "--dryRun"):
            dryRun = True
        elif opt in ("-p", "--program"):
            programs.append(arg)
        if opt in ("-a", "--arch"):
            arch = arg
        if opt in ("-t", "--target"):
            target = expanduser(arch)
        else:
            arch = getOS()

    for i in data:
        if i['name'] in programs or 'all' in programs:
            install(i, arch, target, dryRun)
