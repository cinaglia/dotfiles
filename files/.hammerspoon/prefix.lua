--
-- Tmux-based prefix implementation using hotkey modals.
-- Inspired by:
-- https://github.com/raulchen/dotfiles/blob/master/hammerspoon/prefix.lua
--

local module = {}
local config = require('watchers/config')

function module.init(mod, key)
  local modal = hs.hotkey.modal.new(mod, key)

  function startTimer(delay)
    if modal.timer then
      modal.timer:stop()
    end
    modal.timer = hs.timer.doAfter(delay, function()
      modal:exit()
    end)
  end

  function modal:entered()
    modal.alertId = hs.alert.show("Prefix Mode", 9999)
    startTimer(1)
  end

  function modal:exited()
    if modal.alertId then
      hs.alert.closeSpecific(modal.alertId, 0)
    end
    if modal.timer then
      modal.timer:stop()
    end
  end

  function modal:bindWithChain(mod, key, fn)
    modal:bind(mod, key, nil, function() fn() startTimer(0.4) end)
  end

  function modal:bindWithExit(mod, key, fn)
    modal:bind(mod, key, nil, function() fn() module.exit() end)
  end

  -- Exit out of modal mode
  modal:bind('', 'escape', nil, module.exit)
  modal:bind('', key, nil, module.exit)

  module.modal = modal
  return modal
end

function module.exit()
  module.modal:exit()
end

function module.bind(_, mod, key, fn, shouldChain)
  if module.modal then
    if shouldChain then
      module.modal:bindWithChain(mod, key, fn)
    else
      module.modal:bindWithExit(mod, key, fn)
    end
  end
end

function module.disable()
  module.modal.k:disable()
end

function module.enable()
  module.modal.k:enable()
end

return module
