#!/bin/bash

# ::: Shell Script to run after creating the container :::

set -e

# pretty print
check_mark="\u2705"
question_mark="\u2754"
warning_sign="\u26A0"

PURPLE='\033[0;95m'
CYAN='\033[0;96m'
LIME='\033[38;5;154m'

LIGHT_GRAY='\033[38;5;250m'
YELLOW_BOLD_UNDERLINE='\033[1;4;33m' # Bold yellow underline

NC='\033[0m'

colorize() { # $1: color, $2: text
    case $1 in
    main)
        echo -e "\n${CYAN}$2${NC}\n"
        ;;
    sub)
        echo -e "${PURPLE}$2${NC}"
        ;;
    success)
        echo -e "$check_mark ${LIME}$2${NC}"
        ;;
    ask)
        printf "$question_mark ${LIGHT_GRAY}$2${NC}"
        ;;
    warning)
        echo -e "$warning_sign ${YELLOW_BOLD_UNDERLINE}$2${NC}"
        ;;
    *)
        echo $2
        ;;
    esac
}

################################################################################

colorize main "Running post-create.sh..."
colorize sub "Current directory: $(pwd)"

################################################################################

colorize sub "Updating System Packages..."
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install language-pack-ko -y
sudo locale-gen ko_KR.UTF-8
sudo update-locale LANG=ko_KR.UTF-8 LC_MESSAGES=POSIX

sudo apt-get autoremove -y && sudo apt-get clean

################################################################################
# Update .zshrc
colorize sub "Setting up oh-my-zsh..."
cp ./.config/extras/.zshrc ~/.zshrc
cp ./.config/extras/.p10k.zsh ~/.p10k.zsh

# Install zsh plugin dependencies
sudo apt-get install fzf -y

# Install Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Change the default shell to zsh
sudo chsh -s $(which zsh)

################################################################################
# NPM global configuration & packages
colorize sub "Updating Node Packages..."
# npm config set update-notifier false
npm config set fund false
npm install -g npm@latest
npm update -g

# NPM packages in the project
colorize sub "Installing Prettier Plugins in Project..."
npm install -D prettier prettier-plugin-ini prettier-plugin-multiline-arrays prettier-plugin-sh
npm cache clean --force

# Poetry global configuration & packages
poetry config virtualenvs.create true
poetry config virtualenvs.in-project true
poetry config virtualenvs.path .venv

colorize sub "Installing Poetry Plugins globally..."
poetry self add poetry-plugin-up

# Change the permissions of the scripts
sudo chmod +x ./.config/scripts/*.sh

# if 'SKIP_PACKAGES_UPDATE' is set to 'true', skip the package update
if [ "$SKIP_PACKAGES_UPDATE" != "true" ]; then
    ./.config/scripts/update-script.sh
else
    colorize warning "Skipping package update..."
fi

./.config/scripts/cache-clean.sh

# End of the installation
# check gpu
nvidia-smi
