--
-- Draw a semi-transparent overlay on top of all screens and
-- highlight the currently focused window.
--

local module = {}
local overlays = {}
local border = nil

function module.hide()
  if border then
    border:delete()
    border = nil
  end
  if overlays then
    for _, overlay in ipairs(overlays) do
      overlay:delete()
    end
    overlays = {}
  end
end

function module.show()
  module.hide()

  for _, screen in ipairs(hs.screen.allScreens()) do
    local overlay = hs.drawing.rectangle(screen:frame())
    overlay:setFillColor({red=0, blue=0, green=0, alpha=0.4})
    overlay:setStroke(false)
    overlay:show()
    overlays[#overlays+1] = overlay
  end

  local win = hs.window.focusedWindow()
  if win == nil then return end
  border = hs.drawing.rectangle(win:frame())
  border:setStrokeWidth(20)
  border:setStrokeColor({red=1,blue=1,green=1,alpha=0.8})
  border:setRoundedRectRadii(5.0, 5.0)
  border:setFill(false)
  border:setStroke(true)
  border:show()
end

return module
