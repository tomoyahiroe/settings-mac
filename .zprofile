# start to change charactor green
greenS(){
  echo -e "\e[32m"
}
# finish to change charactor 
greenF(){
  echo -e "\e[00m"
}
sz(){
    greenS
    echo -e "source ~/.zprofile"
    source ~/.zprofile
    echo -e "source ~/.zshrc"
    source ~/.zshrc
    greenF
}
cdcode(){
 greenS
 echo -e "move to /Users/hiroetomokana/code_box/"
 cd /Users/hiroetomokana/code_box/
 greenF
}
glog () {
    greenS
    echo "git log visually"
    git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"
    greenF
}

init() {
    nvim ~/.config/nvim/init.lua
}



memo() {
  greenS
  go run /Users/hiroetomokana/code_box/projects/memo-cli/main.go $1 $2
  greenF
}

opg() {
  greenS
  echo "Opening $1 in Google Chrome"
  open $1 -a Google\ Chrome.app
  greenF
}


zettlr() {
  greenS
  echo "Opening $1 in zettlr"
  open $1 -a zettlr
  greenF
}

sblogin() {
  psql $TB_STRING 
}

sbinsert() {
  greenS
  vim ~/code_box/projects/task-board/supabase/seed.sql
  sql_command="$(cat ~/code_box/projects/task-board/supabase/seed.sql)"
  psql "$TB_STRING" -c "$sql_command"
  greenF
}

# Neovimのターミナルモードの謎エラーを防ぐ
export BASH_SILENCE_DEPRECATION_WARNING=1
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
