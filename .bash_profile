############################
#
# MACHINE PROFILES
#
############################

MACHINE_PROFILE=0

MACHINE_HOME=0
MACHINE_WORK=1
MACHINE_EC2=2



############################
#
# DEFAULTS
#
############################

alias ls='ls -aG'
LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

PS1='\[\e[1;33m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
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

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

############################
#
# WORK DEFAULTS
#
############################

if [ $MACHINE_PROFILE = $MACHINE_WORK ]; then
  export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
  export PATH=/usr/local/bin:$PATH
  export ANT_OPTS='-Xmx2G'
  alias srcclean='rm -rf $ALPHA/build; find $ALPHA/src/com/yext -name 'tmp' | xargs rm -rf'
  alias icbm='python tools/icbm/build.py'
  alias play='thirdparty/play/play'
  function bplay() {
    echo -e "\033];$1\007" && icbm :$1_dev && thirdparty/play/play test src/com/yext/$1 ${@:2}
  }
  function brun() {
    echo -e "\033];$1\007" && icbm :$1 && YEXT_SITE=office JVM_ARGS='-Xmx3G' build/$1/$1 ${@:2}
  }
  function buildjs() {
    for t in "$@"
    do
      bjst "${t}"
    done

    if [ $# = 0 ]; then
      bjst
    fi
  }
  function bjst() {
    local p="src/com/yext"
    if [ ! -z "$1" ]; then
      p="${p}/${1}"
    fi

    for i in $(find "${p}" -name prod-config.js)
    do
      d=$(dirname $i)
      echo "compiling ${d:13}..."
      output=$($ALPHA/tools/bin/plovr.sh build $i 2>&1 > /dev/null)
      echo "$output"
    done
  }

  export ALPHA_HOME=/Users/fchen/alpha
  export ALPHA=/Users/fchen/alpha
  export GOROOT=/usr/local/go
  export GOPATH=/Users/fchen/alpha/gocode
  export PATH=/usr/local/go/bin:/Users/fchen/alpha/gocode/bin:$PATH:/usr/local/sbin
  source $ALPHA/tools/bin/bash_helpers.sh

  alias rgrep='grep -rn --color=auto -I --exclude-dir=.metadata --exclude-dir=build --exclude-dir=bin --exclude-dir=depcache --exclude-dir="apache" --exclude-dir=closure --exclude-dir=flume --exclude-dir="hadoop-0." --exclude-dir="jetty-distribution" --exclude-dir=classes --exclude-dir=".hg" --exclude="*.pyc"'

  alias vim=/usr/local/Cellar/vim/7.4.922/bin/vim
fi

############################
#
# HOME DEFAULTS
#
############################

if [ $MACHINE_PROFILE = $MACHINE_HOME ]; then
  HOME_PROGRAMMING="$HOME/Documents/Programming"

  export PATH=/Users/frrakn/.nvm/versions/io.js/v3.0.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/local/go/bin:/usr/local/sbin
  export GOPATH=/Users/frrakn/Documents/Programming/gocode
  export GOROOT=/usr/local/go
  export NVM_DIR="/Users/frrakn/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  export TERM="xterm-256color"
  export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig
  if [ -z ${DISPLAY} ]
  then
    export DISPLAY=:0.0
  fi

  alias EC2_CONNECT="ssh -i ~/frraknpub.pem ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com"

  function EC2_UPLOAD {
    scp -i ~/frraknpub.pem $1 "ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com:~/$2"
  }

  function EC2_DOWNLOAD {
    scp -i ~/frraknpub.pem "ec2-user@ec2-52-23-8-215.compute-1.amazonaws.com:~/$1" .
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
    esac
  }
fi

############################
#
# EC2 DEFAULTS
#
############################


if [ $MACHINE_PROFILE = $MACHINE_EC2 ]; then
	export PATH=$PATH:/usr/local/go/bin
fi
