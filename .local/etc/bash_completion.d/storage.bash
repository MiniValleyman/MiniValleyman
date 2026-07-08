# bash completion for storage
_storage_completion() {
	local cur prev
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	local opts="-h --help -v --version -c --completion"
	if [[ ${COMP_CWORD} -eq 1 ]]; then
		COMPREPLY=( $(compgen -W "${opts}" -f -- "$cur") )
		return
	fi
	COMPREPLY=( $(compgen -f -- "$cur") )
}
complete -F _storage_completion storage
