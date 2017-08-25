--
-- Simple window management.
--

local module = {}
local apply = require('utils').apply

hs.window.animationDuration = 0.0
hs.grid.setGrid('6x2')
hs.grid.setMargins({ x = 0, y = 0 })
hs.grid.ui.cellColor = {0,0,0,0.25}
hs.grid.ui.cellStrokeWidth = 1
hs.grid.ui.selectedColor = {0,0,0,0.4}
hs.grid.ui.highlightColor = {0,0,0,0.4}
hs.grid.ui.highlightStrokeColor = {0,0,0,0.2}

module.focusRight = function()
  local win = hs.window.frontmostWindow()
  win:focusWindowEast()
end

module.focusLeft = function()
  local win = hs.window.frontmostWindow()
  win:focusWindowWest()
end

module.snap = function()
  local win = hs.window.frontmostWindow()
  hs.grid.snap(win)
end

module.snapAll = function()
  local windows = hs.window.orderedWindows()
  for _, win in ipairs(windows) do
    hs.grid.snap(win)
  end
end

-- Determine if window is anchored to either the left or right of the screen.
function getAnchor(cell)
  local grid = hs.grid.getGrid()
  if cell.x == 0.0 then
    return 'left'
  elseif cell.x + cell.w == grid.w then
    return'right'
  end
  -- Middle windows should be handled as anchored to the left.
  return 'left'
end

-- Resize window relative to its position on the screen:
-- Anchored left resizing to the right: wider.
-- Anchored left, resizing to the left: thinner.
-- Anchored right, resizing to the right: wider.
-- Anchored right, resizing to the left: thinner.
function relativeResize(target)
  local win = hs.window.frontmostWindow()
  local screen = win:screen()
  local cell = hs.grid.get(win, screen)
  local anchor = getAnchor(cell)

  if target == anchor then
    hs.grid.resizeWindowThinner(win)
  else
    hs.grid.resizeWindowWider(win)
  end

  if anchor == 'right' then
    hs.grid.pushWindowRight(win)
  end
end

module.resizeRight = apply(relativeResize, 'right')
module.resizeLeft  = apply(relativeResize, 'left')

-- Arrange current window with the given cell
function arrange(cell)
  local win = hs.window.frontmostWindow()
  local screen = win:screen()
  hs.grid.set(win, cell, screen)
end

-- Arrange a current window vertically
function arrangeVertically(y, height)
  local win = hs.window.frontmostWindow()
  local screen = win:screen()
  local cell = hs.grid.get(win, screen)
  arrange(string.format(
    '%d,%s %dx%s', cell.x, y, cell.w, height
  ))
end

-- Horizontal window arragements
module.arrangeFirstThird     = apply(arrange, '0,0 2x2')
module.arrangeSecondThird    = apply(arrange, '2,0 2x2')
module.arrangeThirdThird     = apply(arrange, '4,0 2x2')
module.arrangeFirstTwoThirds = apply(arrange, '0,0 4x2')
module.arrangeFirstHalf      = apply(arrange, '0,0 3x2')
module.arrangeSecondHalf     = apply(arrange, '3,0 3x2')
module.arrangeFullScreen     = apply(arrange, '0,0 6x2')

-- Vertical window arragements
module.arrangeTopHalf = apply(arrangeVertically, {'0', '1'})
module.arrangeBottomHalf = apply(arrangeVertically, {'1', '1'})
module.arrangeFullHeight = apply(arrangeVertically, {'0', '2'})

function isFullScreen(grid, cell)
  return (cell.x == 0 and cell.y == 0 and grid.size == cell.size)
end

-- Toggle fullscreen while retaining last position
local lastPositionMap = {}
module.toggleFullScreen = function()
  local grid = hs.grid.getGrid()
  local win = hs.window.frontmostWindow()
  local screen = win:screen()
  local cell = hs.grid.get(win, screen)
  local winId = win:id()

  if isFullScreen(grid, cell) then
    if lastPositionMap[winId] then
      arrange(lastPositionMap[winId])
      lastPositionMap[winId] = nil
    end
  else
    module.arrangeFullScreen()
    lastPositionMap[winId] = cell
  end
end

return module
