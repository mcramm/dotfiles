## fixme, i duplicated this in xterms - oops
function title {
  if [[ $TERM == "screen" ]]; then
    # Use these two for GNU Screen:
    print -nR $'\033k'$1$'\033'\\\

    print -nR $'\033]0;'$2$'\a'
  elif [[ ($TERM =~ "^xterm") ]] || [[ ($TERM == "rxvt") ]]; then
    # Use this one instead for XTerms:
    print -nR $'\033]0;'$*$'\a'
  fi
}

function precmd {
  title zsh "$PWD"
}

function preexec {
  emulate -L zsh
  local -a cmd; cmd=(${(z)1})
  title $cmd[1]:t "$cmd[2,-1]"
}

function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function uninstall_oh_my_zsh() {
  /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

function set-tab-color {
 if [[ $PWD/ = $HOME/projects/clio/* ]]; then
   case $PWD/ in
     $HOME/projects/clio/themis/*) tab-color-manage;;
     $HOME/projects/clio/grow/*) tab-color-grow;;
     $HOME/projects/clio/identity/*) tab-color-identity;;
     $HOME/projects/clio/billing-service/*) tab-color-cbs;;
     *) tab-color-reset;;
   esac
 fi
}

function chpwd {
  set-tab-color
}

function db {
  case $1 in
    1) db="themis_development_1";;
    2) db="themis_development_2";;
    *) db="common_development";;
  esac

  echo "😘😘  CONNECTING TO `$db` 😘😘"
  mysql --host=127.0.0.1 --port=6033 --user=themis_dev --password=<replace-me> $db
}

function delete-branches() {
  git branch |
    grep --invert-match '\*' | # remove the current branch - we never want to delete this!
    sed -e 's/^[[:space:]]*//' |
    fzf --multi --preview="git log {} --" |
    xargs -r git branch --delete --force # perform deletion
}
