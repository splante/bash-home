
# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim

test -s ~/.alias && . ~/.alias

set -o vi 
alias l='ls -l'
alias lc='ls -FC'
alias md=mkdir
alias rd=rmdir
[ -x /usr/bin/vim ] && alias vi=/usr/bin/vim
[ -x /bin/vim ] && alias vi=/bin/vim
alias ovi=/bin/vi
alias more=less
alias traceroute=/usr/sbin/traceroute
alias rscp='rsync --partial --progress --stats --inplace'
alias sshv='ssh -vvv -o LogLevel=DEBUG3'
alias vless=/usr/share/vim/vim73/macros/less.sh

#shopt -s extglob
[ 2 -le ${BASH_VERSION%%.*} ] && shopt -s extglob


PS1='\[\e]2;\u@\h:$PWD\007\e]1;\h\007\]\u@\h:$PWD> '

#
# This cd function adds ksh functionality 'cd dir1 dir2' which cds to the 
# current directory, except with the string 'dir1' replaced with 'dir2'
# e.g. if the pwd is '/home/user1/Documents/office/'
# and the command issued is 'cd user1 user2'
# the new working directory would be '/home/user2/Documents/office/
#
# Other cd functionality is preserved
#
cd()
{
  #there are options on cd in bash2
  cdopts=""
  while [ "$1" != "${1#-}" ]
  do
    cdopts="${cdopts} ${1}"
    shift
  done

  if [ $# -eq 2 ]
  then
#    pre=${PWD%%$1*}
#    [ "$pre" = "$PWD" ] && { echo "cd: bad substution";  1; }
#    post=${PWD#*$1}
#    newdir="${pre}${2}${post}"
    newdir="${PWD/$1/$2}"
    [ -d "${newdir}" ] || { echo "cd: ${newdir}: no such directory";return 1;}
    echo "${newdir}"
    #echo builtin cd $cdopts "${newdir}"
    builtin cd $cdopts "${newdir}"
  else
    # echo builtin cd $cdopts "$@"
    builtin cd $cdopts "$@"
  fi
}

type()
{
  if [ "$1" = "-c" ]
  then
    shift;
    for f in "$@"
    do
      ff=$(builtin type -p "$f")
      readlink -f "$ff"
    done
  else
    builtin type $typeopts "$@"
  fi
}

mdcd()
{
  mkdir "$@"
  cd "$_"
}

psg () 
{ 
  ps -ef | egrep ^UID\|\[${1:0:1}\]${1:1}
}

pronounce () 
{ 
      wget -qO- $(wget -qO- "http://dictionary.reference.com/browse/$@" |
          grep 'soundUrl' |
          head -n 1 |
          sed 's|.*soundUrl=\([^&]*\)&.*|\1|' |
          sed 's/%3A/:/g;s/%2F/\//g') |
          mpg123 -
}

function wiki
{
  dig +short txt $(echo $* | sed 's/ /_/g').wp.dg.cx|sed -E "s/\" \"|^\"|\"$|\\\\//g" | fmt;
}

