modules=(
  grunt
  eslint
  npm-which
)

modules=$(printf '%s","' "${modules[@]}" | rev | cut -c 4- | rev)
not_installed=$(npm list -g --json | jq -r ".dependencies | [\"${modules}\"] - keys | .[]")

# Install all missing modules
test $not_installed && npm install -g ${not_installed[*]}
