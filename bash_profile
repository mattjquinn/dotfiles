# MQUINN 11-22-2013 : Modifying CLASSPATH for ANTLR4.
export CLASSPATH=".:/usr/local/lib/antlr-4.1-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.1-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# MQUINN 12-12-2013 : Adding SSH aliases for Xen domUs.
alias ssh-xen="ssh mquinn@xen"
alias ssh-ops="ssh -p4 mquinn@ops"
alias ssh-ora="ssh -p8888 oracle@oracle"

alias ssh-hadoop1="ssh -p1414 hduser@192.168.0.100"
alias ssh-hadoop2="ssh -p1515 hduser@192.168.0.100"
alias ssh-hadoop3="ssh -p1616 hduser@192.168.0.100"
alias ssh-hadoop4="ssh -p1717 hduser@192.168.0.100"

# MQUINN 02-20-2014 : tmux only sources .bash_profile; ensure
# settings in .bashrc are also applied.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias mqlock="xtrlock"
