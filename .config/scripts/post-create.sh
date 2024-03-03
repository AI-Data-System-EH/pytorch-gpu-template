#!/bin/bash

# ::: Shell Script to run after creating the container :::

set -e # Exit immediately if a command exits with a non-zero status.

################################# Colorize #####################################
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

#################################### CWD #######################################

colorize main "Running post-create.sh..."
colorize sub "Current directory: $(pwd)"

#################################### APT #######################################

colorize sub "Updating System Packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install common packages
sudo apt-get install -y \
    shc # Shell script compiler

# locale
sudo locale-gen ${LANG:-ko_KR.UTF-8}
sudo update-locale LANG=${LANG:-ko_KR.UTF-8} LC_MESSAGES=${LC_MESSAGES:-POSIX}
sudo apt-get install language-pack-ko -y

sudo apt-get autoremove -y && sudo apt-get clean

#################################### ZSH #######################################
# Update .zshrc
colorize sub "Setting up oh-my-zsh..."
cp ./.config/extras/.zshrc ~/.zshrc
cp ./.config/extras/.p10k.zsh ~/.p10k.zsh

# Install zsh plugin dependencies
sudo apt-get install fzf -y

# Install zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Install zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Install zsh-completions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fi

# Install Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Change the default shell to zsh
sudo chsh -s $(which zsh)

#################################### NVM #######################################
# Install nvm
colorize sub "Installing nvm..."

export NVM_DIR="$HOME/.nvm"
export NVM_VERSION="latest"

find_version_from_git_tags() {
    local variable_name=$1 # e.g. NVM_VERSION
    local repository=$2

    local latest_version
    latest_version=$(git ls-remote --tags ${repository} | awk -F/ '{print $3}' | grep -E '^v?[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -n1)
    eval "$variable_name=$latest_version"
}
find_version_from_git_tags NVM_VERSION "https://github.com/nvm-sh/nvm"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash

# Load nvm
source "${NVM_DIR}/nvm.sh"

nvm install --lts
nvm alias default node

#################################### NPM #######################################
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

################################## Poetry ######################################
# Poetry global configuration & packages
poetry config virtualenvs.create true
poetry config virtualenvs.in-project true
poetry config virtualenvs.path .venv

colorize sub "Installing Poetry Plugins globally..."
poetry self add poetry-plugin-up

############################## Custom Scripts ##################################
# Change the permissions of the scripts
# sudo chmod +x ./.config/scripts/*.sh

# if 'SKIP_PACKAGES_UPDATE' is set to 'true', skip the package update
if [ "$SKIP_PACKAGES_UPDATE" != "true" ]; then
    update-script # .config/scripts/bin/update-script
else
    colorize warning "Skipping package update..."
fi

cache-clean # .config/scripts/bin/cache-clean

################################ End of Script #################################
# End of the installation
# check gpu detected correctly
nvidia-smi
