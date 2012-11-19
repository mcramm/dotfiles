PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
'
RPS1='%{$fg[blue]%}%D{%b %e, %T}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} ?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔"
