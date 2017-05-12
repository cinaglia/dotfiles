--
-- Various utility functions
--

local module = {}

-- Make-shift partial application
module.apply = function(f, args)
  return function()
    return f(table.unpack(args))
  end
end

-- Add a delay to a given function
module.delay = function(fn, delay)
  return module.apply(hs.timer.doAfter, {delay, fn})
end

return module
