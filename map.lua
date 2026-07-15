local M = {}

M.__index = M

function M:new(options)
  local platforms = {}
  table.insert(platforms,
    {
      x = 100,
      y = 500,
      width = 500,
      height = 30,
    }
  )

  return setmetatable({
    player = options.player,
    platforms = platforms,
  }, M)
end

function M:update(dt)
    local is_on_ground = false
    for _, plat in ipairs(self.platforms) do
      if
        self.player.y+self.player.height >= plat.y and
        self.player.x >= plat.x and
        self.player.x <= plat.x+plat.width
      then
        is_on_ground = true
        self.player.dy = 0
        break
      end
    end
    self.player.on_ground = is_on_ground
end

function M:draw()
  local r,g,b,a = love.graphics.getColor()

  love.graphics.setColor(1, 0, 0, 1)

  for _, p in ipairs(self.platforms) do
    love.graphics.rectangle("fill", p.x, p.y, p.width, p.height)
  end

  love.graphics.setColor(r,g,b,a)
end

return M
