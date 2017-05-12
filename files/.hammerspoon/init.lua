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
prefix:bind('', 'l', window.focusRight, true)
prefix:bind('', 'h', window.focusLeft, true)

-- Snap windows
prefix:bind('', 's', window.snap)
prefix:bind('shift', 's', window.snapAll)

-- Resize windows based on their position
prefix:bind('shift', 'l', window.resizeRight, true)
prefix:bind('shift', 'h', window.resizeLeft, true)

-- Most common arrangements
prefix:bind('', '1', window.arrangeFirstThird)
prefix:bind('', '2', window.arrangeSecondThird)
prefix:bind('', '3', window.arrangeThirdThird)
prefix:bind('', '4', window.arrangeFirstTwoThirds)
prefix:bind('', 'f', window.arrangeFullScreen)

-- Next/previous space
prefix:bind('', 'n', utils.apply(hs.eventtap.keyStroke, {'ctrl', 'right'}), true)
prefix:bind('', 'p', utils.apply(hs.eventtap.keyStroke, {'ctrl', 'left'}), true)
