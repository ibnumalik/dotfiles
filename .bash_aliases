alias ..='cd ..'
alias d-killall='docker kill $(docker ps -q)'
alias d-rmall='docker rm $(docker ps -a -q)'
alias d-rmiall='docker rmi $(docker images -q)'
