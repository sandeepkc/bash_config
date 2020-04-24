# Use sss instead of ssh to not have to enter password after the first time
sss () {
  ssh-copy-id -i ~/.ssh/id_rsa.pub  -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $1
  #ssh-copy-id -i ~/.ssh/id_rsa.pub $1
  ssh "$@"
}

alias dev="ssh ess@10.20.124.245"

export JAVA_HOME=$(/usr/libexec/java_home)

export M2_HOME="/Users/sandeepc/Downloads/apache-maven-3.6.3"
PATH="${M2_HOME}/bin:${PATH}"
export PATH

export PATH="$PATH:$HOME/bin"

if [ -f ~/SandeepPersonal/bash_config/sandeep_bashrc_mac.sh ]; then
    . ~/SandeepPersonal/bash_config/sandeep_bashrc_mac.sh
fi
