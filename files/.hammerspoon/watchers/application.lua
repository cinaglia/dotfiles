--
-- Watch applications and update the environment based on which app is active
--

local module = {}

local prefix = require('prefix')
local iterm = hs.appfinder.appFromName("iTerm2")
local events = {
  [hs.application.watcher.activated] = true,
  [hs.application.watcher.launched] = true,
  [hs.application.watcher.unhidden] = true,
}

function updateApplicationEnvironment(app)
  if app == iterm then
    hs.keycodes.setLayout('U.S.')
    prefix:disable()
  else
    hs.keycodes.setLayout('U.S. International - PC')
    prefix:enable()
  end
end

function onApplicationChange(name, event, app)
  if (events[event]) then
    updateApplicationEnvironment(app)
  end
end

module.init = function()
  updateApplicationEnvironment(hs.application.frontmostApplication())
  module.watcher = hs.application.watcher.new(onApplicationChange)
  module.watcher:start()
end

return module