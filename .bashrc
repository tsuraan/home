# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

(__git_ps1 >/dev/null 2>&1) || . /usr/share/bash-completion/git

export PROMPT_DIRTRIM=2
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;36m\]\$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] "


# . /etc/bash_completion

# Put your fun stuff here.
function _chgit() {
  if [ "x" == "x$2" ]; then
    cd $1
  else
    `lazycd $1 $2`
  fi
}
alias l=ls
alias sp='_chgit ~/src/sparkweave/spokes'
alias pro='_chgit ~/src/sparkweave/projects'
alias dl='_chgit ~/src/sparkweave/disklayout'
alias fsi='mono ~/FSharp-2.0.0.0/bin/fsi.exe'
alias grpe=grep

PATH=$HOME/.cabal/bin:/usr/lib/ccache/bin:~/bin:$PATH:$HOME/local/bin
CPATH=$CPATH:$HOME/local/include/
LDPATH=$LDPATH:$HOME/local/lib/
LD_LIBRARY_PATH=$LDPATH:$HOME/local/lib/
LC_CTYPE=en_US.utf-8
export PATH LDPATH LD_LIBRARY_PATH LC_CTYPE CPATH

export LESS='-R -M --shift 5 -X -F'

PYTHONPATH=$PYTHONPATH:$HOME/src/sparkweave
PYTHONPATH=$PYTHONPATH:$HOME/src/sparkweave/spokes
PYTHONPATH=$PYTHONPATH:$HOME/local/lib/python2.6/site-packages/
PYTHONPATH=$PYTHONPATH:$HOME/.cabal/bin/
PYTHONPATH=$PYTHONPATH:$HOME/src/sparkweave/spokes/hub/project_tools/pylintplugins
export PYTHONPATH


keychain ~/.ssh/id_dsa
. ~/.keychain/$HOSTNAME-sh
. ~/.keychain/$HOSTNAME-sh-gpg

