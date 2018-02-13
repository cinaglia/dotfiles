OS=`uname -s | tr '[:upper:]' '[:lower:]'`
APPS_DIRECTORY=$HOME/dotfiles/apps/

# Install OS-specific applications
for t in $APPS_DIRECTORY/$OS/*; do
  sh $t
done

# Install global applications
sh $APPS_DIRECTORY/global.sh
