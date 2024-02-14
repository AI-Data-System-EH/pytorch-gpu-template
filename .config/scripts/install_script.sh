#!/bin/bash
# ::: Shell Script to install the project :::

# Help print
# if --help or -h in any position, print help and exit
help_func() {
    echo "Usage: install_script.sh [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help       show this help message and exit"
    echo "  -v, --verbose    show verbose output"
    echo "  -q, --quiet      install quietly without any prompt (yes to all)"
    echo "  --virtualenv     install poetry virtual environment"
    echo "  --npm            install node packages"
    echo "  --vsce           install vscode extensions"
    echo ""
    echo "Examples:"
    echo "  install_script.sh"
    echo "  install_script.sh --help"
    echo "  install_script.sh --verbose"
    echo "  install_script.sh --quiet"
    echo "  install_script.sh --python --npm"
}

# Get options
options=$(getopt -o hvq --long help,verbose,quiet,virtualenv,npm,vsce -- "$@")
[ $? -eq 0 ] || { # if the return code is not 0
    echo "Invalid options provided : $*"
    help_func
    exit 1
}

# help option
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    help_func
    exit 0
fi

# Set the options to the positional parameters
eval set -- "$options"

# Default options
verbose=false
quiet=false
all=true
venv=false
npm=false
vsce=false

# Parse options
while true; do
    case "$1" in
    -h | --help)
        help_func
        exit 0
        ;;
    -v | --verbose)
        verbose=true
        shift
        ;;
    -q | --quiet)
        quiet=true
        shift
        ;;
    --virtualenv)
        venv=true
        shift
        ;;
    --npm)
        npm=true
        shift
        ;;
    --vsce)
        vsce=true
        shift
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Unexpected option: $1"
        exit 1
        ;;
    esac
done

# ::: Variables :::
if [ "$venv" = true ] || [ "$npm" = true ] || [ "$vsce" = true ]; then
    all=false
fi

# ::: Emoji :::
# Emoji codes
check_mark="\u2705"
cross_mark="\u274C"
warning_sign="\u26A0"
info_sign="\u26A1"
question_mark="\u2754"

# ::: Colorize the output :::

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'

ORANGE='\033[38;5;208m'
PURPLE='\033[0;95m'
CYAN='\033[0;96m'
LIME='\033[38;5;154m'

LIGHT_GRAY='\033[38;5;250m'
GRAY='\033[38;5;245m'

C1='\033[90;47m'  # Dark gray with white background
C2='\033[1;4;33m' # Bold yellow underline

NC='\033[0m' # No Color

# Colorize the output
colorize() { # $1: color, $2: text
    case $1 in
    red)
        echo -e "${RED}$2${NC}"
        ;;
    green)
        echo -e "${GREEN}$2${NC}"
        ;;
    yellow)
        echo -e "${YELLOW}$2${NC}"
        ;;
    blue)
        echo -e "${BLUE}$2${NC}"
        ;;
    orange)
        echo -e "${ORANGE}$2${NC}"
        ;;
    purple)
        echo -e "${PURPLE}$2${NC}"
        ;;
    cyan)
        echo -e "${CYAN}$2${NC}"
        ;;
    lime)
        echo -e "${LIME}$2${NC}"
        ;;
    gray)
        echo -e "${GRAY}$2${NC}"
        ;;
    gray_bg)
        echo -e "${C1}$2${NC}"
        ;;
    main)
        echo -e "\n${ORANGE}$2${NC}\n"
        ;;
    sub)
        echo -e "${PURPLE}$2${NC}"
        ;;
    success)
        echo -e "$check_mark ${LIME}$2${NC}"
        ;;
    fail)
        echo -e "$cross_mark ${RED}$2${NC}"
        ;;
    info)
        echo -e "\n$info_sign ${CYAN}$2${NC}"
        ;;
    ask)
        printf "$question_mark ${LIGHT_GRAY}$2${NC}"
        ;;
    warning)
        echo -e "$warning_sign ${YELLOW}$2${NC}"
        ;;
    *)
        echo $2
        ;;
    esac
}

# ::: pwd to the project root :::

cd "$(git rev-parse --show-toplevel)" || exit

# ::: Check the prerequisites :::
# 1. Python

colorize main "Checking the prerequisites..."

# 1. Python
min_python_version="3.11"
python_installed=false
if ! command -v python3 &>/dev/null; then
    colorize warning "Python is not installed"
    exit 1
fi

# 1-1. Check the version (must be 3.11 or higher : pyproject.toml)
python_version=$(python3 --version | cut -d " " -f 2)
if [ "$(printf '%s\n' $min_python_version "$python_version" | sort -V | head -n1)" = "3.11" ]; then
    colorize success "Python version: $python_version"
    python_installed=true
else
    colorize warning "Python version must be $min_python_version or higher"
    exit 1
fi

# 1-2. Install python if not installed
if [ "$python_installed" = false ]; then
    colorize ask "Do you want to install Python$min_python_version? (y/n): "
    read choice

    while [ "$choice" != "y" ] && [ "$choice" != "n" ]; do
        colorize ask "Invalid choice. Enter 'y' or 'n': "
        read choice
    done
    if [ "$choice" = "y" ]; then
        sudo add-apt-repository ppa:deadsnakes/ppa
        sudo apt update
        sudo apt install python$min_python_version
        colorize success "Python installed."

        # Check the installed versions
        colorize info "Installed Python versions:"
        python_versions=$(ls /usr/bin/python*)
        for version in $python_versions; do
            colorize gray "- $version"
        done

        # Set the python3 to the installed version
        sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python$min_python_version 1
        sudo update-alternatives --config python3

        # Check the version
        python_version=$(python3 --version | cut -d " " -f 2)
        colorize success "Newly installed Python version: $python_version"

        python_installed=true

    else
        colorize warning "Python is not installed. Exiting..."
        exit 1
    fi
fi

# ::: Check the dependencies :::

# Check if the dependencies are installed
# 1. Poetry
# 2. Node (npm)
# 3. VSCode

colorize main "Checking the dependencies..."

# 1. Poetry
if [ "$venv" = true ] || [ "$all" = true ]; then
    if ! command -v poetry &>/dev/null; then
        colorize fail "poetry is not installed"
        exit 1
    else
        colorize success "poetry: $(poetry --version)"
    fi
fi

# 2. Node (npm)
if [ "$npm" = true ] || [ "$all" = true ]; then
    if ! command -v npm &>/dev/null; then
        colorize fail "npm is not installed"
        exit 1
    else
        colorize success "npm: $(npm --version)"
    fi
fi

# 3. VSCode
if [ "$vsce" = true ] || [ "$all" = true ]; then
    if ! command -v code &>/dev/null; then
        colorize fail "code is not installed"
        exit 1
    else
        colorize success "code: $(code --version | head -n 1)"
    fi
fi

# ::: Install the project :::

### Install the project
colorize main "Installing the project..."

# Run the installation
# 1. VSCode extensions
# 2. Python packages (Poetry)
# 3. Node packages (NPM)

### 1. VSCode extensions
if [ "$vsce" = true ] || [ "$all" = true ]; then
    colorize info "Installing the VSCode extensions..."

    # 1-1. Read the extensions list
    extensions_list=$(cat .config/scripts/extensions.txt)
    if [ -z "$extensions_list" ]; then
        colorize warning "'extensions.txt' not found. Skip extension installation."
        exit 1
    else
        # 1-2. Ask to install which extensions (if not quiet)
        if [ "$quiet" != true ]; then

            colorize ask "Do you want to install all the extensions? (y to all, n to select) [y/n]: "
            read choice

            while [ "$choice" != "y" ] && [ "$choice" != "n" ]; do
                colorize ask "Invalid choice. Enter 'y' or 'n': "
                read choice
            done
            if [ "$choice" = "y" ]; then
                colorize sub "All recommended extensions will be installed."
            elif [ "$choice" = "n" ]; then
                fzf_preview_msg="echo 'Move with arrow keys, Tab to select, Enter to continue, Esc to cancel.'"
                extensions_list=$(echo "$extensions_list" | fzf --multi --preview-window=up:1:wrap --preview="$fzf_preview_msg")
            fi
        fi

        extensions_list=($(echo "$extensions_list"))

        # 1-3. Install the extensions
        if [ ${#extensions_list[@]} -eq 0 ]; then
            colorize warning "No extensions selected. Skip extension installation."
        else
            colorize sub "\nInstalling the extensions..."
            install_count=0
            total_count=${#extensions_list[@]}
            for extension in "${extensions_list[@]}"; do
                idx=$((idx + 1))
                progress="($idx/$total_count)"
                # skip if the extension is already installed
                if code --list-extensions | grep -q $extension; then
                    colorize gray "$progress Extension '$extension' is already installed. Skip."
                    continue
                fi
                code --install-extension $extension
                colorize success "$progress Extension '$extension' installed."
                install_count=$((install_count + 1))
            done
            install_skip=$((${#extensions_list[@]} - $install_count))
            colorize success "$install_count extensions newly installed. $install_skip extensions skipped."
        fi
    fi
fi

### 2. Python packages (Poetry)
if [ "$venv" = true ] || [ "$all" = true ]; then
    colorize info "Installing the python packages..."

    # 2-0. Use poetry python version
    poetry env use python$min_python_version

    # 2-1. Install the packages
    poetry install --no-root
    colorize success "Python packages installed."

    # 2-2. Install pre-commit hooks
    colorize info "Installing pre-commit hooks..."
    poetry run pre-commit install
    colorize success "Pre-commit hooks installed."
fi

### 3. Node packages (NPM)
if [ "$npm" = true ] || [ "$all" = true ]; then
    colorize info "Installing the node packages..."

    # 3-1. Install the packages
    npm install
    colorize success "Node packages installed."
fi

# ::: Finish :::

if [ "$quiet" != true ] && [ "$all" = true ]; then
    colorize ask "Do you want to check updates? (y/n): "
    read choice

    while [ "$choice" != "y" ] && [ "$choice" != "n" ]; do
        colorize ask "Invalid choice. Enter 'y' or 'n': "
        read choice
    done
    if [ "$choice" = "y" ]; then
        colorize main "Checking updates..."
        colorize info "Updating Git submodules..."
        git submodule update --init --recursive

        colorize info "Updating Poetry python packages..."
        poetry update

        colorize info "Updating Node packages..."
        npm update

        colorize info "Updating pre-commit hooks..."
        pre-commit autoupdate

        colorize success "Update finished! 🚀"
    fi
fi

colorize main "Installation finished! 🎉"

colorize sub "- To activate the virtual environment, run 'poetry shell' or 'source .venv/bin/activate'."
colorize sub "- To start with project, open the 'project.code-workspace' in vscode."
colorize sub "- To update the packages, run '.config/scripts/update_script.sh'."
