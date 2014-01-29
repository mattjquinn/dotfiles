# MQUINN 11-22-2013 : Modifying CLASSPATH for ANTLR4.
export CLASSPATH=".:/usr/local/lib/antlr-4.1-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.1-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# MQUINN 12-12-2013 : Adding SSH aliases for Xen domUs.
alias ssh-xen="ssh mquinn@xen"
alias ssh-evm="ssh -p4 mquinn@evm"
alias ssh-ora="ssh -p8888 oracle@oracle"
