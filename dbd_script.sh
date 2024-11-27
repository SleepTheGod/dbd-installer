#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

show_help() {
    echo -e "${GREEN}dbd - A tool to listen or connect over TCP with encryption options${NC}"
    echo -e "Usage:"
    echo -e "  dbd -h                Show help message"
    echo -e "  dbd --help            Show help message"
    echo -e "  dbd [-options] host port     Connect to a host and port"
    echo -e "  dbd -l -p port        Listen on a specific port"
    echo -e "  dbd -e prog           Execute a program after connection (e.g., bash or cmd.exe)"
    echo -e "  dbd -r n              Retry connection every 'n' seconds"
    echo -e "  dbd -c on|off         Enable or disable encryption"
    echo -e "  dbd -k secret         Set a custom encryption phrase"
    echo -e "  dbd -v                Enable verbose output"
    echo -e "  dbd -V                Print version info"
    echo -e "  dbd -s                Invoke a shell (if setuid root)"
    echo -e "  dbd -D on|off         Fork and run in the background"
    echo -e "  dbd -P prefix         Add a prefix to all outbound data"
    echo -e "  dbd -m                Toggle snooping"
    echo -e "  dbd -n                Toggle numeric IP addresses"
    echo -e "${RED}Note: Ensure you have the necessary permissions and dependencies installed.${NC}"
}

install_dbd() {
    echo -e "${GREEN}Installing dbd...${NC}"
    sudo apt update
    sudo apt install -y build-essential git
    if [ ! -d "dbd" ]; then
        git clone https://github.com/gitbrew/dbd.git
        cd dbd
        make
        sudo make install
        cd ..
    else
        cd dbd
        git pull
        make
        sudo make install
        cd ..
    fi
    echo -e "${GREEN}dbd installation complete. You can now use the 'dbd' command.${NC}"
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_help
elif [ "$1" == "install" ]; then
    install_dbd
else
    echo -e "${RED}Invalid option. Use '-h' or '--help' for help.${NC}"
fi
