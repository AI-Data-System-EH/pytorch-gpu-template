#!/bin/bash
# Shell Script to clean the cache folder

# Help print
# if --help or -h in any position, print help and exit
help_func() {
    echo "Usage: cache_clean.sh [options] [path1] [path2] ..."
    echo ""
    echo "Options:"
    echo "  --dry-run        show what would be deleted"
    echo "  -h, --help       show this help message and exit"
    echo "  -v, --verbose    show verbose output"
    # echo "  -p, --pattern    glob pattern to match"
    # echo "  -i, --ignore     glob pattern to ignore"
    echo ""
    echo "Examples:"
    echo "  cache_clean.sh"
    echo "  cache_clean.sh --help"
    echo "  cache_clean.sh --dry-run"
    echo "  cache_clean.sh --verbose"
    # echo "  cache_clean.sh --pattern \"**/__pycache__\""
    # echo "  cache_clean.sh --ignore \"**/venv\" \"**/node_modules\""
    # echo "  cache_clean.sh --pattern \"**/__pycache__\" --ignore \"**/venv\""
    echo ""
}

# Patterns to match (glob patterns)
# end with / to match directories
# end with $ to match end of string
# end with /$ to match directories

# start with ** to match any directory
# ^ to match start of string

patterns=(
    "__pycache__$"
    ".pytest_cache$"
    ".coverage_report$"
    "htmlcov$"
    ".coverage$"
    "coverage.xml$"
)

ignores=(
    ".venv"
    ".env"
    "venv"
    "env"
    "virtualenv"
    "node_modules"
    "build"
    "dist"
    "site-packages"
)

# Get options
# options=$(getopt -o h,p:,i:,v --long help,dry-run,pattern:,ignore:,verbose -- "$@") || {
#     help_func
#     exit 1
# }
options=$(getopt -o h,v --long help,dry-run,verbose -- "$@") || {
    help_func
    exit 1
}

eval set -- "$options"

# Parse options
dry_run=false
verbose=false

while true; do
    case "$1" in
    -h | --help)
        help_func
        exit 0
        ;;
    --dry-run)
        dry_run=true
        shift
        ;;
    -v | --verbose)
        verbose=true
        shift
        ;;
    # -p | --pattern)
    #     # Add pattern to patterns until next option appears (--) or end of options
    #     while [ $# -gt 0 ]; do
    #         if [[ $2 == -* ]]; then
    #             break
    #         fi
    #         patterns+=("$2")
    #         shift
    #     done
    #     ;;
    # -i | --ignore)
    #     # Add ignore to ignores until next option appears (--) or end of options
    #     while [ $# -gt 0 ]; do
    #         if [[ $2 == -* ]]; then
    #             break
    #         fi
    #         ignores+=("$2")
    #         shift
    #     done
    #     ;;
    --)
        shift
        break
        ;;
    esac
done


# Header
header="Cache Clean"
if [ $dry_run = true ]; then
    header="$header (dry run)"
fi

# Print header
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
echo ""
echo "$header"
echo ""

# Print patterns and ignores
if [ "$verbose" = true ]; then
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    echo ""
    echo "Patterns : ${#patterns[@]} patterns"
    for pattern in "${patterns[@]}"; do
        printf '    %s\n' $pattern
    done
    echo "Ignores  : ${#ignores[@]} ignores"
    for ignore in "${ignores[@]}"; do
        printf '    %s\n' $ignore
    done
    echo ""
fi

# Function to delete files in a given parameter (path)
delete_func() {
    # Get path
    path=$1

    # Check if path exists
    if [ ! -d "$path" ]; then
        echo "Path does not exist: $path"
        exit 1
    fi

    # Print path
    abspath=$(realpath $path)
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    printf '\033[0;95m'
    echo "Searching in: $abspath"
    printf '\033[0m'
    echo ""

    # shell options to use globstar
    shopt -s globstar nullglob dotglob extglob

    ############################################################################

    regex_patterns=$(printf '%s|' "${patterns[@]}")
    regex_patterns=${regex_patterns%|}
    regex_ignores=$(printf '%s|' "${ignores[@]}")
    regex_ignores=${regex_ignores%|}

    # echo "regex_patterns: $regex_patterns"
    # echo "regex_ignores: $regex_ignores"

    # Find files and folders
    found_files=$(find $abspath -type f -regextype posix-extended -regex ".*($regex_patterns).*" | sort | uniq)
    found_folders=$(find $abspath -type d -regextype posix-extended -regex ".*($regex_patterns).*" | sort | uniq)

    found_files=$(echo "$found_files" | grep -v -E "($regex_ignores)")
    found_folders=$(echo "$found_folders" | grep -v -E "($regex_ignores)")

    found_all=$(echo "$found_files" "$found_folders" | sort | uniq)

    # Search found_files if inside found_folders
    for folder in $found_folders; do
        for file in $found_files; do
            if [[ $file == $folder* ]]; then
                found_files=$(echo "$found_files" | grep -v -E "$file")
            fi
        done
    done

    # Search found_folders if inside found_folders
    for folder in $found_folders; do
        for folder2 in $found_folders; do
            if [[ $folder2 == $folder* ]] && [[ $folder2 != $folder ]]; then
                found_folders=$(echo "$found_folders" | grep -v -E "$folder2")
            fi
        done
    done

    ############################################################################

    # If no files or folders found, exit
    if [ -z "$found_files" ] && [ -z "$found_folders" ]; then
        printf '\033[0;33m'
        echo "No Cache files found."
        printf '\033[0m'
        echo ""
        return 0
    fi

    # exit 0

    ############################################################################

    # Count found files
    count_found_file=$(echo "$found_files" | wc -l)
    count_found_folder=$(echo "$found_folders" | wc -l)
    # count_found=$(echo "$found_all" | wc -l)
    count_found=$(echo $(($count_found_file + $count_found_folder)))

    # Print results
    if [ $count_found -gt 0 ]; then
        if [ "$verbose" = true ] || [ "$dry_run" = true ]; then
            printf '\033[0;33m'
            echo "Found    : $count_found"
            echo "    DIR  : $count_found_folder"
            echo "    FILE : $count_found_file"
            printf '\033[0m'
        fi

        # If dry run, just show the files
        if [ "$dry_run" = true ]; then
            if [ "$verbose" = true ]; then
                echo ""
                printf '\033[0;32m'
                echo "Found files:"
                for file in $found_all; do
                    printf '    %s\n' $file
                done
                printf '\033[0m'
                echo ""
            fi
        else
            # If not dry run, delete the files
            echo ""
            printf '\033[0;32m'
            for file in $found_all; do
                if [ "$verbose" = true ]; then
                    printf '    Delete... %s\n' $file
                fi
                rm -rf $file
            done
            if [ "$verbose" = true ]; then
                echo ""
            fi
            # Delete count files
            echo "Deleted  : $count_found"
            echo "    DIR  : $count_found_folder"
            echo "    FILE : $count_found_file"
            printf '\033[0m'
            echo ""
        fi
    fi
}

# Get paths with options
# If no path is given, use current directory
if [ $# -eq 0 ]; then
    set -- "."
fi

# Iterate over all paths and
for arg in "$@"; do
    delete_func $arg
done

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
