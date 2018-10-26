# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
# End of lines configured by zsh-newuser-install

alias vi="vim"
alias pacaur='trizen'
alias pacclean='pacaur -Rs $(pacaur -Qdtq)'
alias allzip='aunpack -e'
alias randbg='wal -i ~/Sync/Wallpapers'
alias email='offlineimap && notmuch new'


PATH="/home/neosloth/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/neosloth/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/neosloth/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/neosloth/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/neosloth/perl5"; export PERL_MM_OPT;
