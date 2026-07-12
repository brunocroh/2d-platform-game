local M = {}

M.__index = M

function M:new(props)


  return setmetatable({
    x = props.x,
    y = props.y,
  }, M)
end

function M:update(dt)

end

function M:draw()
  love.graphics.rectangle('fill', self.x, self.y, 20, 80)
end

return M

