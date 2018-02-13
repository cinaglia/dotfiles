# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep -i "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Init brew-specific apps
brew_prefix=/usr/local
brew_apps=(etc/bash_completion etc/profile.d/z.sh)
for app in "${brew_apps[@]}"; do
  [ -f $brew_prefix/$app ] && . $brew_prefix/$app
done

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
