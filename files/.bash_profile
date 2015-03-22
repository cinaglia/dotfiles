DOTFILES=~/dotfiles

# Glob dotfiles
shopt -s dotglob

# Source all files in ~/dotfiles/sources/*
# Examples: .extra, .bash_prompt, .exports, .aliases, .functions
# .extra can be used for settings you don’t want to commit
for file in ${DOTFILES}/sources/*; do
	[ -r "$file" ] && source "$file"
done
