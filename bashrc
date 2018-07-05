export PS1='\[\033[01;35m\]\u@westMac\[\033[01;37m\]\$ \[\033[00m\]'
export LESS=-q
export LSCOLORS=gxfxcxdxbxegedabagacad
export PGDATA=/usr/local/var/postgres


alias ls='ls -G'
alias start_psql='pg_ctl -l /usr/local/var/postgres/server.log start'
alias stop_psql='pg_ctl -D /usr/local/var/postgres stop'

export PYTHONPATH=/Users/Yoshida/github/org_module:$PYTHONPATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
