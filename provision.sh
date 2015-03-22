export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`

for t in $HOME/dotfiles/provision/$OS/tasks/*; do
    sh $t
done