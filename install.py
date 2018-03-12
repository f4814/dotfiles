import sys
import os
from yaml import load, dump
from os.path import abspath, expanduser

def getInfo(name):
    with open(name, 'r') as f:
        data = load(f)
    return data


def install(info):
    directory = "./" + info['name'] + "/"
    os.system("mkdir " + directory + "old 2> /dev/null")

    if 'preconf_hook' in info:
        for i in info['preconf_hook']:
            cmd = "sh " + directory + i
            print(cmd)
            os.system(cmd)

    if 'files' in info:
        files = info['files']
        for i in files.keys():
            origin = directory + i
            target = files[i]
            for j in target:
                if os.path.isfile(expanduser(j)):
                    cmd = "mv -f " + expanduser(j) + " " + abspath(directory + "old")
                    print(cmd)
                    os.system(cmd)
                cmd = "ln " + abspath(origin) + " " + expanduser(j)
                print(cmd)
                os.system(cmd)

    if 'folders' in info:
        folders = info['folders']
        for i in folders.keys():
            origin = directory + i
            target = folders[i]
            for j in target:
                if os.path.isdir(expanduser(j)):
                   cmd = "mv -f " + expanduser(j) + " " + abspath(directory + "old/")
                   print(cmd)
                   os.system(cmd)
                if os.path.islink(expanduser(j)):
                        cmd = "rm " + expanduser(j)
                        print(cmd)
                        os.system(cmd)
                cmd = "ln -s " + abspath(origin) + " " + expanduser(j)
                print(cmd)
                os.system(cmd)

    if 'postconf_hook' in info:
        for i in info['postconf_hook']:
            cmd = "bash " + directory + i
            print(cmd)
            os.system(cmd)


if __name__ == "__main__":
    data = getInfo('config.yml')
    for i in data:
        if i['name'] in sys.argv or 'all' in sys.argv:
            install(i)
