# ifetch
ifetch is a simple and lightweight tool that prints out system information.

<img src="screenshot.png" alt="ifetch Screenshot" width="50%">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub stars](https://img.shields.io/github/stars/Ietsiee/ifetch?style=flat)

## Features
- Fast and minimal
- Written entirely in POSIX shell
- Lightweight with no unnecessary dependencies
- Simple configuration
- Easy to add your own modules

## Requirments
- A POSIX shell installed like Bash, Dash, Ash and more
- Basix userland tools

## Installation
You can install ifetch using one of the following methods

### Linux
Requirments: sudo, tar and wget
```curl -fsSL https://raw.githubusercontent.com/Ietsiee/ifetch/main/installers/install.sh | sh```

### Termux
Requirments: tar and wget
```curl -fsSL https://raw.githubusercontent.com/Ietsiee/ifetch/main/installers/install-termux.sh | sh```

### Make
Requirments: sudo, install and make
```
git clone https://github.com/Ietsiee/ifetch.git
cd ifetch
sudo make install
```
