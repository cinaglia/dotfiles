--
-- Automatically reload hammerspoon configuration
--

local module = {}

module.reload = function()
  module.watcher:stop()
  hs.reload()
end

module.watcher = hs.pathwatcher.new(
  os.getenv('HOME') .. '/dotfiles/files/.hammerspoon/',
  module.reload
)

module.init = function()
  module.watcher:start()
end

hs.notify.new({
  title = 'Hammerspoon',
  subTitle = 'Configuration reloaded.'
}):send()

return module
