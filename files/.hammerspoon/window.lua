--
-- Window management. Pretty much stolen from:
-- https://github.com/miromannino/miro-windows-management
--


local module = {}

hs.window.animationDuration = 0.0
hs.grid.setGrid('6x1')
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

-- TODO: Make this smarter
module.wider = function()
  local win = hs.window.frontmostWindow()
  hs.grid.resizeWindowWider(win)
end

-- TODO: Make this smarter
module.thinner = function()
  local win = hs.window.frontmostWindow()
  hs.grid.resizeWindowThinner(win)
end

module.arrange = function(cell)
  local win = hs.window.frontmostWindow()
  local screen = win:screen()
  hs.grid.set(win, cell, screen)
end

return module
