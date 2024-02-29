#!/bin/bash
# ::: Shell Script to update the project :::

check_mark="\u2705"
question_mark="\u2754"

PURPLE='\033[0;95m'
CYAN='\033[0;96m'
LIME='\033[38;5;154m'

LIGHT_GRAY='\033[38;5;250m'

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
    *)
        echo $2
        ;;
    esac
}

# ::: pwd to the project root :::

cd "$(git rev-parse --show-toplevel)" || exit

# ::: Update Git Submodules :::

colorize main "Updating Git submodules..."

# Update submodules
git submodule update --init --recursive

# ::: Update Poetry Projects :::

colorize main "Updating Poetry python packages..."

poetry up --latest

# Update installed packages
# poetry update

# Update lock file
# poetry lock

# Install dependencies
# poetry install --no-root --sync

# Clean the cache
# poetry cache clear . --all --no-interaction

# ::: Update Node packages :::

colorize main "Updating Node packages..."

# Update installed packages
npm update
npm update -g

# Update lock file
# npm install --package-lock-only

# Remove unneeded dependencies
# npm prune

# Clean the cache
# npm cache clean --force
# npm cache verify

# ::: Update pre-commit hooks :::

colorize main "Updating pre-commit hooks..."

# Check if pre-commit hooks are installed
if [ ! -f .git/hooks/pre-commit ]; then
    poetry run pre-commit install
fi

# Update pre-commit hooks
poetry run pre-commit autoupdate

echo -e "\n"
colorize success "Update finished! 🎉"
