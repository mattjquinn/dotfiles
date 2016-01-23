# MQUINN 11-22-2013 : Modifying CLASSPATH for ANTLR4.
export CLASSPATH=".:/usr/local/lib/antlr-4.1-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.1-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# MQUINN 05-25-2014 : Aliases for AWS instances
alias ssh-awsnat="ssh ec2-user@54.208.221.151"

# MQUINN 02-20-2014 : tmux only sources .bash_profile; ensure
# settings in .bashrc are also applied.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias mqlock="xtrlock"

# Import functions for cb, a wrapper around xclip.
source ~/dotfiles/bash/cb.sh

# Use vim for writing/editing Git commit messages.
export GIT_EDITOR=vim

# Java environment settings.
#JAVA_HOME=/usr/lib/jvm/jdk1.7.0_45
JAVA_HOME=/usr/lib/jvm/jdk1.8.0_25
PATH=$JAVA_HOME/bin:$PATH

# Apache Maven environment settings.
M2_HOME=/usr/local/apache-maven/apache-maven-3.2.1
M2=$M2_HOME/bin
MAVEN_OPTS="-Xms256m -Xmx512m"
PATH=$M2:$PATH

# OPAM configuration
. /home/mquinn/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# MQUINN 12-22-2014 : Adding Ant to classpath.
ANT_HOME=/opt/apache-ant-1.9.4
PATH=$ANT_HOME/bin:$PATH

# MQUINN 01-17-2015 : Adding cargo (Rust pkg mgr) to classpath.
CARGO_HOME=/opt/cargo
PATH=$CARGO_HOME/bin:$PATH

# MQUINN 05-28-2015 : Adding ninja build system to path.
NINJA_HOME=/opt/ninja
PATH=$NINJA_HOME/:$PATH
