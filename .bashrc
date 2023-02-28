#!/bin/bash

export GPG_TTY=$(tty)

raise () {
    : "${__raise:?$1}"
}

src () {
    . $HOME/$1/.bashrc
}

rsrc () {
    __conda_prefix=$CONDA_PREFIX

    . ~/.bashrc

    if [ ! -z $__conda_prefix ]; then
        env_name=`basename $__conda_prefix`
        if [ "$env_name" != "anaconda3" ]; then
            conda activate "$env_name"
        fi
    fi
}
# alias rsrc='. ~/.bashrc'

loop () {
    for i in $(seq $1); do
        eval ${@:2}
    done
}

cdd () {
    cd $1 && ls
}

cddv () {
    cd $1 && ls -alh
}

settup () {
    curl -Ls https://cutt.ly/setup-$1
}

setup () {
    settup $1 | bash
}

ctls () {
    cat $1 | less
}

ctgp () {
    cat $1 | grep $2
}

ctgpi () {
    cat $1 | grep $2 -v
}

. $HOME/bash-tools/ssh.sh
. $HOME/bash-tools/gpg.sh
. $HOME/bash-tools/backup.sh

. $HOME/bash-tools/conda.sh
. $HOME/bash-tools/python.sh

. $HOME/bash-tools/nvidia.sh
