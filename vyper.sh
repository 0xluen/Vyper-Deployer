#!/bin/bash

echo "1 - Install"
echo "2 - Only Compile"
echo "3 - Deploy"
read -p "Enter your choice (1, 2, or 3): " choice

if [[ "$choice" == "1" ]]; then
    # İnstall seçeneği
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -x "$(command -v pacman)" ]; then
            echo "Arch Linux detected. Installing..."
            sudo pacman -S git base-devel
            git clone https://github.com/pyenv/pyenv.git ~/.pyenv
            echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
            echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
            echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.bashrc
            source ~/.bashrc
            sudo pacman -S tk
            pyenv install 3.10.0
            pyenv global 3.10.0
            sudo pacman -S nodejs
        elif [ -x "$(command -v apt)" ]; then
            echo "Ubuntu detected. Installing..."
            sudo apt update
            sudo apt install git curl build-essential libssl-dev zlib1g-dev libbz2-dev \
                libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
                xz-utils tk-dev libffi-dev liblzma-dev
            curl https://pyenv.run | bash
            echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
            echo 'eval "$(pyenv init -)"' >> ~/.bashrc
            echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
            source ~/.bashrc
            pyenv install 3.10.0
            pyenv global 3.10.0
            sudo apt-get install -y nodejs
        else
            echo "Unsupported operating system detected."
            exit 1
        fi
        npm install
        echo "Installing Vyper..."
        pip install vyper==0.3.7
        pip3 install python-dotenv
        echo "Installation completed."
    else
        echo "This script only works on Linux operating systems."
        exit 1
    fi
elif [[ "$choice" == "2" ]]; then
    # Only Compile seçeneği
    if [ ! -f "compiler.py" ]; then
        echo "compiler.py file not found."
        exit 1
    fi
    echo "Running compiler ..."
    python3 compiler.py
    echo "Script execution completed."
elif [[ "$choice" == "3" ]]; then
    # Deploy seçeneği
    if [ ! -f "compiler.py" ]; then
        echo "compiler.py file not found."
        exit 1
    fi
    echo "Running compiler ..."
    python3 compiler.py
    echo "Script execution completed."
    node deployer.js
else
    echo "Invalid choice. Please enter 1, 2, or 3."
    exit 1
fi
