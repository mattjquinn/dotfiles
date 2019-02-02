# MQUINN 11-22-2013 : Modifying CLASSPATH for ANTLR4.
#export CLASSPATH=".:/opt/antlr/antlr-4.7.1-complete.jar:$CLASSPATH"
#alias antlr4='java -jar /opt/antlr/antlr-4.7.1-complete.jar'
#alias grun='java org.antlr.v4.runtime.misc.TestRig'

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
#JAVA_HOME=/usr/lib/jvm/jdk1.8.0_25
#PATH=$JAVA_HOME/bin:$PATH

# Apache Maven environment settings.
M2_HOME=/usr/local/apache-maven/apache-maven-3.6.0
M2=$M2_HOME/bin
MAVEN_OPTS="-Xms256m -Xmx512m"
PATH=$M2:$PATH

# OPAM configuration
. /home/mquinn/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# MQUINN 12-22-2014 : Adding Ant to classpath.
#ANT_HOME=/opt/apache-ant-1.9.4
#PATH=$ANT_HOME/bin:$PATH

# MQUINN 05-28-2015 : Adding ninja build system to path.
#NINJA_HOME=/opt/ninja
#PATH=$NINJA_HOME/:$PATH

# MQUINN 12-11-2016 : Display calendar events ocurring today and tomorrow.
# Only show this week and next.
pal -r 0-2 -c 1

# MQUINN 03-20-2017 : Adding Cargo, Rust, Rustup
# to PATH.
export PATH="$HOME/.cargo/bin:$PATH"

# MQUINN 10-09-2017 : Using vi mode in shell
# (pg 342 of UNIX and Linux Sys Admin 5th ed).
set -o vi

# MQUINN 11-07-2017 : coreutils after/around
# version 8.28 is adding quotes to the output
# of `$ ls` for filenames with whitespace in
# their names; setting this flag to revert.
export QUOTING_STYLE=literal

# MQUINN 08-12-2018 : Trying to use Python 3 all the time.
alias python="python3.7"

# MQUINN 08-28-2018: Want to use pip binaries on command
PATH=$PATH:~/.local/bin

# MQUINN 01-08-2018: Adding Yarn to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# MQUINN 01-12-2019: Adding terraform to path.
export PATH=$PATH:/opt/terraform

# MQUINN 02-02-2019: Adding duplicacy to path.
export PATH=$PATH:"/opt/duplicacy_2.1.2"
