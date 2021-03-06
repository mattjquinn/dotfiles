# MQUINN 11-22-2013 : Modifying CLASSPATH for ANTLR4.
export CLASSPATH=".:/opt/antlr/antlr-4.7.1-complete.jar:$CLASSPATH"
alias antlr='java -jar /opt/antlr/antlr-4.7.1-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

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
# MQUINN 10-09-2017 : Using vi mode in shell
# (pg 342 of UNIX and Linux Sys Admin 5th ed).
set -o vi

# MQUINN 11-07-2017 : coreutils after/around
# version 8.28 is adding quotes to the output
# of `$ ls` for filenames with whitespace in
# their names; setting this flag to revert.
export QUOTING_STYLE=literal

# MQUINN 08-12-2018 : Trying to use Python 3 all the time.
#alias python="python3.7"

# MQUINN 08-28-2018: Want to use pip binaries on command
PATH=$PATH:~/.local/bin

# MQUINN 01-08-2018: Adding Yarn to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# MQUINN 01-12-2019: Adding terraform to path.
#export PATH=$PATH:/opt/terraform

# MQUINN 02-02-2019: Adding duplicacy to path.
export PATH=$PATH:"/opt/duplicacy_2.1.2"

# MQUINN 02-12-2019: Adding CockroachDB to path.
#export PATH=$PATH:"/opt/cockroach-v2.1.4.linux-amd64"

# MQUINN 02-11-2019: Adding gradle to path.
export PATH=$PATH:"/opt/gradle-5.2.1/bin"

# MQUINN 02-14-2019: Adding Kubernetes-related binaries to path.
#export PATH=$PATH:"/opt/kubernetes"

# MQUINN 02-25-2019: Adding IntelliJ.
export _JAVA_AWT_WM_NONREPARENTING=1
alias intellij="sh /opt/intellij/bin/idea.sh"

# MQUINN 04-04-2019: Adding mdbook (for generating Rust book documentation).
export PATH=$PATH:"/opt/mdbook_docgenerator"

# MQUINN 07-21-2019: Adding crosstool-ng to path for building cross platform toolchains
export PATH=$PATH:"/opt/crosstool-ng/bin"

# MQUINN 07-27-2019: Add Processing (light patterns)
export PATH=$PATH:"/opt/processing-3.5.3"

# MQUINN 08-12-2019: Increase bash history + store history immediately
HISTSIZE=1000000
HISTFILESIZE=1000000
PROMPT_COMMAND='history -a'

printf "cmds: $ {atop, fuser, crash, firejail, rlwrap, i7z, strace}\n"
printf "\n"

export PATH="$HOME/.cargo/bin:$PATH"

alias gs="git status"

# 12-25-2020: Add NVM for NPM/nodejs environments
# (note: first line chooses a default for NVM so that it doesn't
# check everywhere for which to use because the check delays shell load time).
export PATH=~/.nvm/versions/node/v15.5.0/bin:$PATH
export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

alias python="python3"

# MQUINN 04-20-2021: Replacing `sudo service openvpn start` with
# this command, which gives greater flexibility and more importantly
# works more reliably, esp with regard to not having DNS rules changed
# permanently until next reboot after killing the VPN process.
piavpn(){
  wd=/etc/openvpn/pia
  pia_locations="$wd/pia-location-configs-oct-2020"
  if [ "$#" -ne 1 ]
  then
    ls $pia_locations
    echo "Usage: piavpn <location> for a valid PIA site."
    return 1
  fi
  location=$1
  # OVPN filename is quoted because it may contain spaces.
  sudo openvpn --config $pia_locations/"$1.ovpn" \
          --verb 4 \
          --auth-user-pass $wd/acct_credentials.txt
}

