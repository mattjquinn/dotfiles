# MQUINN 11-22-2013 : Modifying CLASSPATH for ANTLR4.
export CLASSPATH=".:/usr/local/lib/antlr-4.1-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.1-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# MQUINN 12-12-2013 : Adding SSH aliases for Xen domUs.
alias ssh-xen="ssh mquinn@xen"
alias ssh-xenops="ssh -p4 opsdev@ops"
alias ssh-xenora="ssh -p8888 oracle@oracle"

# MQUINN 05-25-2014 : Aliases for AWS instances
alias ssh-awsnat="ssh ec2-user@vpcnat.enterrupt.com"
alias ssh-awsops="ssh opsdev@ops.enterrupt.com"

# MQUINN 04-04-2014 : Adding OpenVPN server for use from public Wifi points.
alias ssh-vpn="ssh admin@10.8.0.1"

# MQUINN 02-20-2014 : tmux only sources .bash_profile; ensure
# settings in .bashrc are also applied.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias mqlock="xtrlock"

# Import functions for cb, a wrapper around xclip.
source ~/dotfiles/bash/cb.sh
