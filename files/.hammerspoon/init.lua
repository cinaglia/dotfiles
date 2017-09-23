local apply = require('utils').apply
local config = require('watchers/config')
local window = require('window')
local prefix = require('prefix')
local application = require('watchers/application')

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

-- Horizontal arrangements
prefix:bind('', '1', window.arrangeFirstThird)
prefix:bind('', '2', window.arrangeSecondThird)
prefix:bind('', '3', window.arrangeThirdThird)
prefix:bind('', '4', window.arrangeFirstTwoThirds)
prefix:bind('shift', '1', window.arrangeFirstHalf)
prefix:bind('shift', '2', window.arrangeSecondHalf)
prefix:bind('', 'f', window.arrangeFullScreen)
prefix:bind('', 'z', window.toggleFullScreen)

-- Vertical arrangements
prefix:bind('shift', 'j', window.arrangeBottomHalf)
prefix:bind('shift', 'k', window.arrangeTopHalf)
prefix:bind('', 'space', window.arrangeFullHeight)

-- Next/previous space
prefix:bind('', 'n', apply(hs.eventtap.keyStroke, {'ctrl', 'right'}), true)
prefix:bind('', 'p', apply(hs.eventtap.keyStroke, {'ctrl', 'left'}), true)

-- Logitech G600 shortcuts
-- Window arrangements
hs.hotkey.bind({'cmd', 'alt'}, '1', nil, window.arrangeFirstHalf)
hs.hotkey.bind({'cmd', 'alt'}, '2', nil, window.arrangeSecondHalf)
-- Scroll left/right
hs.hotkey.bind({'cmd', 'alt'}, '3', nil, apply(hs.eventtap.scrollWheel, {{1, 0}, {}, 'px'}))
hs.hotkey.bind({'cmd', 'alt'}, '4', nil, apply(hs.eventtap.scrollWheel, {{-1, 0}, {}, 'px'}))
