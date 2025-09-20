print_git_changes_to_commit() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        echo " "
    else
        echo "✔ "
    fi
}

ARROW=$'\uf0a9 '
BOLD="\[\e[1m\]"
BLUE="\[$(tput setaf 12)\]"
ORANGE="\[$(tput setaf 3)\]"
RESET_COLOR="\[$(tput sgr0)\]"
PS1="${BOLD}${BLUE}\w${RESET_COLOR} ${BOLD}${ORANGE}\$(parse_git_branch) \$(print_git_changes_to_commit)$ARROW ${RESET_COLOR}"
