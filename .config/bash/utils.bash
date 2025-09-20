parse_git_branch() {
    git symbolic-ref --short HEAD 2> /dev/null
}
