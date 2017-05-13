--
-- Various utility functions
--

local module = {}

function istable(t)
  return type(t) == 'table'
end

function tablify(v)
  return istable(v) and v or {v}
end

-- Compose
function module.compose(fn1, fn2)
  return function(...)
    return fn1(fn2(...))
  end
end

-- Make-shift partial application
function module.apply(fn, args)
  return function()
    return fn(module.compose(table.unpack, tablify)(args))
  end
end

-- Add a delay to a given function
function module.delay(fn, delay)
  return module.apply(hs.timer.doAfter, {delay, fn})
end

return module
