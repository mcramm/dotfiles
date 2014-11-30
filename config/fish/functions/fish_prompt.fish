function prompt_pwd --description 'Print the current working directory, shortend to fit the prompt'
  echo $PWD | sed -e "s|^$HOME|~|"
end

function git_prompt
    if git root >/dev/null 2>&1
        set_color normal
        printf ' on '
        set_color magenta
        printf '%s ' (git currentbranch ^/dev/null)
        set_color green
        git_prompt_status
        set_color normal
    end
end

function fish_prompt
  set_color magenta
  printf '%s' (whoami)
  set_color normal
  printf ' at '
  set_color yellow
  printf '%s' (hostname -s)
  set_color normal
  printf ' in '
  set_color normal
  printf '%s' (prompt_pwd)

  git_prompt

  echo
  set_color normal
end
