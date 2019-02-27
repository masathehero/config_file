export PS1='\[\033[01;35m\]\u@westMac\[\033[01;37m\]\$ \[\033[00m\]'
export LESS=-q
export PGDATA=/usr/local/var/postgres
export LSCOLORS=gxfxcxdxbxegedabagacad

alias ls='ls -G'
alias ll='ls -alF'
alias l='ls -lF'
alias start_psql='pg_ctl -l /usr/local/var/postgres/server.log start'
alias stop_psql='pg_ctl -D /usr/local/var/postgres stop'
