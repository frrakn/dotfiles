############################
#
# MACHINE PROFILES
#
############################

MACHINE_PROFILE=3

MACHINE_HOME=0
MACHINE_WORK=1
MACHINE_EC2=2
MACHINE_HOME_UBUNTU=3

MACHINE_PROFILE=$MACHINE_HOME_UBUNTU

############################
#
# DEFAULTS
#
############################

alias ls='ls -aG'
LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

PS1="\[\e[1;33m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]"
alias refresh_bash='source ~/.bash_profile'
alias mkdirp='mkdir -p'
alias grep='grep --color=auto'

function grp() {
  grep -rnI --exclude-dir=.git --color=auto "$1" ./
}

function checkpoint() {
  export "frrakn_checkpoint_dir_$1=$(pwd)"
}

function gocheck() {
  varname="frrakn_checkpoint_dir_$1"
  cd ${!varname}
}

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

if [[ -f ~/.git-completion.bash ]]; then
  . ~/.git-completion.bash
fi

############################
#
# WORK DEFAULTS
#
############################

if [[ $MACHINE_PROFILE = $MACHINE_WORK ]]; then
  export PATH=/usr/local/bin:/usr/local/go/bin:$PATH:/usr/local/sbin
  export GOROOT=/usr/local/go
  export IMAGES_ORIG=~/selfmade/images/originals
  export IMAGES_MOD=~/selfmade/images/modified

  alias rgrep='grep -rn --color=auto -I --exclude-dir=.metadata --exclude-dir=build --exclude-dir=bin --exclude-dir=depcache --exclude-dir="apache" --exclude-dir=closure --exclude-dir=flume --exclude-dir="hadoop-0." --exclude-dir="jetty-distribution" --exclude-dir=classes --exclude-dir=".hg" --exclude="*.pyc"'

  alias vim=/usr/local/Cellar/vim/7.4.2235/bin/vim
fi

############################
#
# HOME DEFAULTS
#
############################

if [[ $MACHINE_PROFILE = $MACHINE_HOME ]]; then
  HOME_PROGRAMMING="$HOME/Documents/Programming"

  export GOPATH=/Users/frrakn/selfmade/gocode/
  export PATH=/Users/frrakn/.nvm/versions/io.js/v3.0.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/local/go/bin:/usr/local/sbin:/Users/frrakn/google-cloud-sdk/bin:/usr/local/mysql/bin:/Users/frrakn/devtools/protoc/bin:$GOPATH/bin
  export GOROOT=/usr/local/go
  export NVM_DIR="/Users/frrakn/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  export TERM="xterm-256color"
  export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig
  if [[ -z ${DISPLAY} ]]
  then
    export DISPLAY=:0.0
  fi
  export KUBERNETES_PROVIDER=aws

  alias EC2_CONNECT="ssh -i ~/frraknpub.pem ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com"
  alias EC22_CONNECT="ssh -i ~/frraknpub.pem ec2-user@ec2-52-201-251-238.compute-1.amazonaws.com"
  alias TB_CONNECT="ssh -i ~/treebeer.pem ec2-user@ec2-52-207-220-185.compute-1.amazonaws.com"

  function EC2_UPLOAD {
    scp -i ~/frraknpub.pem $1 "ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com:~/$2"
  }

  function EC22_UPLOAD {
    scp -i ~/frraknpub.pem $1 "ec2-user@ec2-52-201-251-238.compute-1.amazonaws.com:~/$2"
  }

  function EC2_DOWNLOAD {
    scp -i ~/frraknpub.pem "ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com:~/$1" .
  }

  function EC22_DOWNLOAD {
    scp -i ~/frraknpub.pem "ec2-user@ec2-52-201-251-238.compute-1.amazonaws.com:~/$1" .
  }

  function qw {
    case $1 in
      'tb')
        cd "$HOME_PROGRAMMING/gocode/src/github.com/frrakn/treebeer"
        ;;
      'ml')
        cd "$HOME_PROGRAMMING/machineLearning"
        ;;
      'dl')
        cd "$HOME/Downloads"
        ;;
      'gc')
        cd "$HOME_PROGRAMMING/gocode"
        ;;
      'hb')
        cd "$HOME_PROGRAMMING/myhubot"
        ;;
      'sm')
        cd "$HOME_PROGRAMMING/selfmade"
        ;;
    esac
  }
fi

############################
#
# EC2 DEFAULTS
#
############################


if [[ $MACHINE_PROFILE = $MACHINE_EC2 ]]; then
  export PATH=$PATH:/usr/local/go/bin
fi

############################
#
# DEBIAN MACHINE DEFAULTS
#
############################

if [[ $MACHINE_PROFILE = $MACHINE_HOME_DEBIAN ]]; then
  export GEM_HOME=$HOME/.gems
  export PATH=$PATH:$HOME/.gems/bin
fi
