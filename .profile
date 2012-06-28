  # Sample .profile for SuSE Linux
# rewritten by Christian Steinruecken <cstein@suse.de>
#
# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings, see below.

test -z "$PROFILEREAD" && . /etc/profile

# Most applications support several languages for their output.
# To make use of this feature, simply uncomment one of the lines below or
# add your own one (see /usr/share/locale/locale.alias for more codes)
#
#export LANG=de_DE@euro     # uncomment this line for German output
#export LANG=fr_FR@euro     # uncomment this line for French output
#export LANG=es_ES@euro     # uncomment this line for Spanish output


# Some people don't like fortune. If you uncomment the following lines,
# you will have a fortune each time you log in ;-)

if [ -x /usr/bin/w ] ; then
    echo
    /usr/bin/w
fi
if [ -x /usr/bin/fortune ] ; then
    echo
    /usr/bin/fortune
fi
echo

export PATH="$HOME/bin:$PATH"

#export PS1="\u@\h:\w\n$ "

[ -d $HOME/zweb ] && export ZWEB_HOME=$HOME/zweb

[ -d $HOME/apps/groovy-1.7.7 ] && {
  export GROOVY_HOME=$HOME/apps/groovy-1.7.7
  export PATH=$GROOVY_HOME/bin:$PATH
}

#[ -f $HOME/ec/bin/env.sh ] && . $HOME/ec/bin/env.sh
[ -d /opt/grails-1.3.7/ ] && {
  export GRAILS_HOME=/opt/grails-1.3.7/
  echo $PATH|grep $GRAILS_HOME >/dev/null 2>&1 ||
    export PATH=$GRAILS_HOME/bin:$PATH
}
