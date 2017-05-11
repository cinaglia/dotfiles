utils = require('utils')
config = require('watchers/config')
window = require('window')
prefix = require('prefix')
application = require('watchers/application')

-- Initialize stateful modules
prefix.init('', 'F18')
config.init()
application.init()

-- Hammerspoon mappings
prefix:bind('', 'c', hs.toggleConsole)
prefix:bind('', 'q', hs.hints.windowHints)
prefix:bind('', 'g', hs.grid.toggleShow)
prefix:bind('', 'r', config.reload)

-- Focus
prefix:bind('', 'l', window.focusRight)
prefix:bind('', 'h', window.focusLeft)

-- Snap windows
prefix:bind('', 's', window.snap)
prefix:bind('shift', 's', window.snapAll)

-- Resize windows
prefix:bind('shift', 'l', window.wider)
prefix:bind('shift', 'h', window.thinner)

-- Most common arrangements (L/M/R 1/3, L2/3)
prefix:bind('', '1', utils.apply(window.arrange, {'0,0 2x1'}))
prefix:bind('', '2', utils.apply(window.arrange, {'2,0 2x1'}))
prefix:bind('', '3', utils.apply(window.arrange, {'4,0 2x1'}))
prefix:bind('', '4', utils.apply(window.arrange, {'0,0 4x1'}))

-- Next/previous space
prefix:bind('', 'n', utils.apply(hs.eventtap.keyStroke, {'ctrl', 'right'}))
prefix:bind('', 'p', utils.apply(hs.eventtap.keyStroke, {'ctrl', 'left'}))
