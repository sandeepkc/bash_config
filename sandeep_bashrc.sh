:<<'FILE_INTRO'
What: Work in progress custom settings
Why: To make life easier

Note: This file has .sh extension so that I can get nice syntax highlighting

Include in ".bashrc" as following:
if [ -f ~/sandeep_bashrc.sh ]; then
    . ~/.sandeep_bashrc.sh
fi

Great tools/settings to always have:
1. Command-line fuzzy finder - https://github.com/junegunn/fzf
   and its vim integration
2. fugitive-vim - https://github.com/tpope/vim-fugitive for git commands
   from within vim
3. tmux
4. fd (use fd instead of find)
5. ag (use ag instread of grep)
6. diff-so-fancy instead of diff (refer to .gitconfig)
7. Passwordless ssh for logging to dev vm, and sss (also set no confirmation on ssh to a new machine)

Files to take to completely migrate from one dev machine to another:
1. This one
2. ~/.vimrc
3. ~/.gitconfig

FILE_INTRO



# VMware aliases
WORK_HOME="~/work"
WORK_HOME_PATH="~/work/nsx"
IDAS_PATH="$WORK_HOME/nsx/mp/proton/id-allocation"
IDAS_CODE_PATH="$IDAS_PATH/src/main/java/com/vmware/nsx/management/idas"
PROTON_PATH="$WORK_HOME/nsx/mp/proton"

alias push_review="git push ssh://sandeepc@gitreview.eng.vmware.com:29418/nsx HEAD:refs/for/master"
#alias build='mvn clean install -DskipTests -T 4'
# -T option gives build issues
alias build='mvn clean install -DskipTests'
alias build_with_tests='mvn clean install'
alias work="cd $WORK_HOME_PATH"
alias proton="cd $PROTON_PATH"
alias idas="cd $IDAS_PATH"
alias idas_code="cd $IDAS_CODE_PATH"
alias vm_gui="sudo start lightdm"
alias colibri_log="cd /tmp/pytest-of-ess"
alias build_mp="./gobuild.sh nsx-mp --localcommits -- --user sandeepc"
#Login to dbc
alias dbc="sss sandeepc@sc-dbc1222.eng.vmware.com"
#Corfu specific
push_to_corfu="git push ssh://sandeepc@gitreview.eng.vmware.com:29418/nsx HEAD:refs/for/dk-mp-corfu"
pull_from_corfu="git pull origin dk-mp-corfu"
corfu_build="mvn clean install -Dspring.profiles.active=\"CorfuDao\" -DskipTests"
#End VMware aliases



# show git branches in details
alias gitb="git branch -vv"

#Fix terminal
alias fix='echo -e "\033c" ; stty sane; setterm -reset; reset; tput reset; clear'

# !$ is argument of the last command

export_path="export PATH=~/bin/apache-maven-3.5.0/bin/:$PATH"

# Use sss instead of ssh to not have to enter password after the first time
sss () {
  ssh-copy-id -i ~/.ssh/id_rsa.pub  -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $1
  #ssh-copy-id -i ~/.ssh/id_rsa.pub $1
  ssh "$@"
}



:<<'MOVE_IN_TERMINAL'
CTRL Key Bindings:

Useful but known:
Ctrl + a - Jump to the start of the line
Ctrl + e - Jump to the end of the line
Ctrl + l - Clear the screen
Ctrl + z - Suspend/ Stop the command
Ctrl + c - Terminate the command

Useful:
Ctrl + k - Delete to EOL
Ctrl + u - Delete backward from cursor
Ctrl + r - Search the history backwards

Not so useful:
Ctrl + f - Move forward a char
Ctrl + b - Move back a char
Ctrl + d - Delete from under the cursor

ALT Key Bindings:
(To make ALT work in iterm2, go to the default profile in iterm2->preferences->profiles->default->Keys and change left option to +Esc)

Useful ones:

Alt + back-space - Delete backward from cursor
Alt + b - Move backward
Alt + f - Move forward
Alt + d - Delete word

Not so useful:

Alt + ? - Show current completion list
Alt + * - Insert all possible completions
Alt + . - Yank last argument to previous command
Alt + c - Capitalize the word
Alt + l - Make word lowercase
Alt + u - Make word uppercase
Alt + t - Move words around
MOVE_IN_TERMINAL


#Fun aliases
#The matrix: "cmatrix"
alias matrix="cmatrix"
#Run locomotive: "sl"
alias gaadi="sl"
#Fortune teller: "fortune"
alias aur_batao="fortune"
#End fun aliases



:<<'VIM_AND_BASH_SHORTCUTS'
# Being good at VIM:
Autocomplete - in the insert mode after typing the substring press 'control n'
Formatting a block - go to visual mode by pressing 'v' and then select the text area to be formatted and then 'gq'
Change case - SHIFT + tilde (keep pressing and the cursor will keep moving after changing the case
Move the next line up - while on the top line, do 'J'
Go to last edit - g + ;

Filtering in VIM, very helpful while working with large files
Tips and commands to be added
1. Use search and replace - http://vim.wikia.com/wiki/Search_and_replace
Visual select till end of file: Shift + g
Examples:

1. :%s/sandeep/kumar/gc - replace all occurrences of 'sandeep' by 'kumar'
in the file globally and ask for confirmation [then 'y' for one confirmation,
and 'a' for all confirmations]
2. :%s/sandeep[0-9]\+/kumar/gc - replace all occurrences such sandeep[digits] by kumar
3. :%s/MAC=[:0-9]\+/ip/gc
4. sort u (sort all lines and remove duplicates)
5. :g/profile/d - delete all lines that contain the string "profile"
6. :!g/profile/d - delete all the lines that don't contain the string "profile"
note that "!g" is same as "v"
7. :v/error\|warn\|fail/d - delete all lines except those that contain "error" or "warn" or "fail" 


# Move around bash command
Ctrl-U: delete to the beginning of line
Ctrl-K: delete to the end of line

#Cut and paste:
Position the cursor where you want to begin cutting.
Press v to select characters, or uppercase V to select whole lines
Move the cursor to the end of what you want to cut.
Press d to cut (or y to copy).
Move to where you would like to paste.
Press P to paste before the cursor, or p to paste after.

#Delete stuff in vim
D - delete line after cursor
d0 - delete line before cursor

#Move around VIM
e
Move to the end of a word.

w 
Move forward to the beginning of a word.

W 
Move forward a WORD (any non-whitespace characters).

b 
Move backward to the beginning of a word.

$ 
Move to the end of the line.

0 
Move to the beginning of the line.

H 
Jump to the top of the screen.

L 
Jump to the bottom of the screen.

G 
Jump to end of file.

gg 
Jump to beginning of file

50G 
Jump to line 50.

'. 
Jump to the last-changed line.

 % 
Jump to corresponding item, e.g. from an open brace to its matching closing brace. See Moving to matching braces for more.

VIM_AND_BASH_SHORTCUTS



# Make life easier

#Show only the current dir i.e. hide full path
#export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

#Show the first letter of each parent dir
export PS1='`echo "\[\033[01;32m\]\u@\h\[\033[00m\]:\${PWD%/*}" | sed -e "s;\(/.\)[^/]*;\1;g"`/${PWD##*/}$ '

#increase history size
export HISTFILESIZE=500000
export HISTSIZE=100000

#Append to the history fule, don't overwrite
shopt -s histappend

alias install="sudo apt-get install"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias ls="ls -lrth --color=auto"

alias grep="ack-grep"

#show hidden files
alias ls.='ls -d .* --color=auto'

# Usage example: "h git"
alias h='history | grep --color'

#Because "less" is better than "more" (Eg, scroll back)
alias more="less"

alias vi="vim"
alias c="clear"

#Enhanced tools - better than the regular ones
#Install the following tools
#sudo apt install htop ncdu pydf colordiff 
alias top="sudo htop"
alias du="ncdu"
alias df="pydf"
#alias diff="colordiff" //use diff-so-fancy instead

# Usage example: Ping fast - 200ms interval
alias ping='ping -i 0.2'

#print all the PATHs
alias path='echo -e ${PATH//:/\\n}'

#Safety
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'

alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# Display current dir in tree form
alias tree="/bin/ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 

# Usage: extract example.tar
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# Get a specific column in an output, example: "df -h | fawk 2" will get second column
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

#System info
alias cpuinfo='lscpu'
alias meminfo="free -m -l -t"

alias comp_info="uname -a"
alias mem_info="cat /proc/meminfo"

#get all the ip addresses
alias getip="ifconfig | sed -En 's/128.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

#Get your public IP
alias myip="curl http://ipecho.net/plain; echo"

# Show which applications are connecting to the network
alias listen="lsof -P -i -n" 

# List all firewall rules
alias firewall='sudo /sbin/iptables -L -n -v --line-numbers'
#End make life easy aliases


:<<'FUZZY_SEARCH'
Usage:
1. Launch fzf in vim, hit ";" (after vim integration)
2. Launch fzf outside, enter "o"
3. Ctrl+R - search shell commands from history
4. agf . or agf search-term for fuzzy grep using ag
FUZZY_SEARCH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Launch fzf in the current dir and open the selected file with vim
o() {
  local files
  IFS=$'\n' files=($(fzf-tmux -d 50% --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

#Launch fzf in the current dir and cd to the dir of selected file
cdff() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

#launch fzf in current dir and cd to the selector dir
cdf() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

#Fuzzy grep using ag
agf() {
  local file
  local line

  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     vim $file +$line
  fi
}



:<<'VIM_FUGITIVE'
Usage (from within vim):
:Gdiff - git diff for the opened file
:Gblame - git blame for the opened file
VIM_FUGITIVE



:<<'ADDITIONAL_INFO'

Find ip
	ifconfig
	ip addr show

Find DNS 
	cat /etc/resolv.conf

Tool to control network manager
	nmcli nm wifi on //start wifi
	nmcli --help OR nmcli nm --help

nmap: Network exploration tool (very powerful)
	nmap --help

Dump traffic
	sudo tcpdump -i eth0	

System info related i.e. cpu, memory, disk, etc and admin commands
top 					: see all processes
uname -a 				: see system info such as OS, kernel, architecture, etc etc
lscpu 					: see CPU related info such as architecture, caches, etc
cat /proc/meminfo			: Memory usage details
df -h					: see disk usage info
du -sh					: see disk usage in current dir
du -h 					: see disk usage directory wise
uptime 					: see how long the system has been running
hostname				: see hostname
last ess				: logging of user 'ess'

Network related:
netstat					: network related info such as sockets, ports, interfaces, etc
netstat -nr				: See routing table
ping <dest>				: ping 'dest'
traceroute <dest> 			: trace the entire route to 'dest'
sudo tcpdump -i eth0 			: dump traffic
nslookup google.com			: query internet name servers
whois google.com			: info about a domain
arp 					: System ARP cache
nmcli 					: cli tool for controlling network manager
cat /etc/resolv.conf			: DNS resolver info
ip addr show  				: show/manipulate routing
nmap (nmap --help)			: Very poweful tool for network exploration
ADDITIONAL_INFO
