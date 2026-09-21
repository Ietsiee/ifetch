# ifetch
ifetch is a fast and lightweight tool for displaying system information, written entirely in POSIX shell.

<p align="center">
  <img src="screenshot.png" alt="ifetch Screenshot" width="100%">
</p>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub stars](https://img.shields.io/github/stars/Ietsiee/ifetch?style=flat)

## Features
- Fast and minimal
- Written entirely in POSIX shell
- Lightweight with no unnecessary dependencies
- Simple configuration
- Easy to make custom modules

## Usage
- ```ifetch``` Runs ifetch
- ```ifetch -h / --help``` Shows help.txt
- ```ifetch -v / --version``` Shows current version

## Requirements
- A POSIX-compatible shell such as Bash, Dash, or Ash
- Basic userland tools

## Installation
You can install ifetch using one of the following methods.

### Linux
**Requirements:** `curl`, `sudo`, `tar` and `wget`
```
curl -fsSL https://raw.githubusercontent.com/Ietsiee/ifetch/main/installers/install.sh | sh
```

### Termux
**Requirements:** `curl`, `tar` and `wget`
```
curl -fsSL https://raw.githubusercontent.com/Ietsiee/ifetch/main/installers/install-termux.sh | sh
```

### AUR
**Coming soon!**
**Requirements:** `yay` or `paru`
```
yay -S ifetch
paru -S ifetch
```

### Make
**Requirements:** `sudo`, `git` and `make`
```
git clone https://github.com/Ietsiee/ifetch.git
cd ifetch
sudo make install
```

## Custom Modules
Creating Your Own Modules
You can create your own modules by creating a shell script in "/etc/ifetch/modules/".

For example:
```
sudo nano /etc/ifetch/modules/CustomModule.sh
```

Add the following shebang at the top of the file:
```
#!/bin/sh
```

Then make the module executable:
```
sudo chmod +x /etc/ifetch/modules/CustomModule.sh
```

Modules are regular POSIX shell scripts, so you can use standard shell features such as "case" statements, and create your own custom options.

For example:
```
case "$1" in
    -g)
        echo ":)"
        ;;
    -h)
        echo "-h option"
        ;;
    *)
        echo "Default option"
        ;;
esac
```

## Feedback
Found a bug or have an idea for ifetch? Open an issue and let me know!
