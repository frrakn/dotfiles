# custom

export PATH=/Users/frrakn/.nvm/versions/io.js/v3.0.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/local/go/bin

export GOPATH=/Users/frrakn/Documents/Programming/treebeer
export GOROOT=/usr/local/go

alias ls='ls -a'
PS1='\[\e[1;33m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
alias refresh_bash='source ~/.bash_profile'
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

############################

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias EC2_CONNECT="ssh -i ~/frraknpub.pem ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com"

function EC2_UPLOAD {
  scp -i ~/frraknpub.pem $1 "ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com:~/$2"
}

function EC2_DOWNLOAD {
	scp -i ~/frraknpub.pem "ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com:~/$1" .
}

export NVM_DIR="/Users/frrakn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export TERM="xterm-256color"

export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig
if [ -z ${DISPLAY} ]
then
  export DISPLAY=:0.0
fi
