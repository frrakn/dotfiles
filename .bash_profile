# custom
alias ls='ls -a'
PS1='\[\e[1;33m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
alias refresh_bash='source /Users/fchen/.bash_profile'
alias mkdirp='mkdir -p'
alias grep='grep --color=auto'

function grp() {
  grep -rnI --exclude-dir=.git --color=auto $1 ./
}

function checkpoint() {
  export "frrakn_checkpoint_dir_$1=$(pwd)"
}

function gocheck() {
  varname="frrakn_checkpoint_dir_$1"
  cd ${!varname}
}
