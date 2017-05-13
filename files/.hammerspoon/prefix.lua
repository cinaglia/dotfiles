--
-- Tmux-based prefix implementation using hotkey modals.
-- Inspired by:
-- https://github.com/raulchen/dotfiles/blob/master/hammerspoon/prefix.lua
--

local module = {}
local modal = nil
local overlays = require('overlays')

function module.init(mod, key)
  modal = hs.hotkey.modal.new(mod, key)

  function modal:entered()
    modal.isChained = false
    modal:startTimer(1)
    overlays.show()
  end

  function modal:exited()
    modal.isChained = false
    modal:stopTimer()
    overlays.hide()
  end

  function modal:stopTimer()
    if modal.timer then
      modal.timer:stop()
    end
  end

  function modal:startTimer(delay)
    modal:stopTimer()
    modal.timer = hs.timer.doAfter(delay, function()
      modal:exit()
    end)
  end

  function modal:bindWithChain(mod, key, fn)
    modal:bind(mod, key, nil, function()
      fn()
      overlays.show()
      modal:startTimer(0.8)
      modal.isChained = true
    end)
  end

  function modal:bindWithExit(mod, key, fn)
    modal:bind(mod, key, nil, function()
      fn()
      modal:exit()
    end)
  end

  -- Exit out of modal mode
  modal:bind('', 'escape', nil, function() modal:exit() end)
  modal:bind('', key, nil, function()
    -- Only exit when not in chained mode.
    -- Helpful when hitting <prefix> immediately after a chainable mapping.
    if not modal.isChained then
      modal:exit()
    end
  end)

  return modal
end

function module.bind(_, mod, key, fn, shouldChain)
  if modal then
    if shouldChain then
      modal:bindWithChain(mod, key, fn)
    else
      modal:bindWithExit(mod, key, fn)
    end
  end
end

function module.disable() modal.k:disable() end
function module.enable() modal.k:enable() end

return module
