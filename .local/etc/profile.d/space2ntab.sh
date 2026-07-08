function space2ntab ()
{
    local R="\e[0m"
    local RED="\e[31m"
    local GRN="\e[32m"
    local YEL="\e[33m"
    local CYN="\e[36m"
    local BLD="\e[1m"

    function _space2ntab_usage ()
    {
        echo -e "${BLD}${CYN}space2ntab${R} – replace spaces with '\\ + newline + TAB' for easier reading\n"
        echo -e "${BLD}Usage:${R}"
        echo -e "  space2ntab <file>"
        echo -e "  space2ntab -h | --help\n"
        echo -e "${BLD}Description:${R}"
        echo -e "  Replaces spaces in lines with:"
        echo -e "    ' \\' + newline + TAB (real tab character)"
        echo -e "  Designed for long commands like './configure ...'\n"
        echo -e "${BLD}Examples:${R}"
        echo -e "  ${CYN}space2ntab configure.txt${R}\n"
    }

    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        _space2ntab_usage
        return 0
    fi

    if [[ -z "$1" ]]; then
        echo -e "${RED}Error:${R} input file not specified\n"
        _space2ntab_usage
        return 1
    fi

    local file="$1"

    if [[ ! -f "$file" ]]; then
        echo -e "${RED}Error:${R} file '${YEL}$file${R}' not found"
        return 1
    fi

    if [[ ! -r "$file" ]]; then
        echo -e "${RED}Error:${R} file '${YEL}$file${R}' is not readable"
        return 1
    fi

    local tmp
    tmp="$(mktemp)" || {
        echo -e "${RED}Error:${R} failed to create temp file"
        return 1
    }

    # Replace spaces between words with " \ + newline + TAB", but keep original lines intact
    awk '{
        for(i=1;i<=NF;i++){
            printf "%s", $i
            if(i<NF){
                printf " \\\n\t"
            }
        }
        printf "\n"
    }' "$file" > "$tmp" || {
        echo -e "${RED}Error:${R} processing failed"
        rm -f "$tmp"
        return 1
    }

    mv -f "$tmp" "$file" || {
        echo -e "${RED}Error:${R} failed to overwrite original file"
        rm -f "$tmp"
        return 1
    }

    echo -e "${GRN}Success:${R} file '${YEL}$file${R}' updated"
}
