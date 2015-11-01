export OS=`uname -s | tr '[:upper:]' '[:lower:]'`

for t in $HOME/dotfiles/provision/$OS/*; do
    sh $t
done

sh $HOME/dotfiles/provision/global.sh
