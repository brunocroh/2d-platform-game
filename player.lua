local Sprite = require('lib.sprite')
local M = {}

M.__index = M

function M:new(props)

  local walk = {}
  local run = {}

  for i = 1, 12, 1 do
    table.insert(
      walk,
      love.graphics.newImage(string.format('assets/common_11_walk%02d.png', i))
    )
  end

  for i = 1, 6, 1 do
    table.insert(
      run,
      love.graphics.newImage(string.format('assets/common_12_run%02d.png', i))
    )
  end

  local sprite = Sprite:new({
    files = {
      walk = walk,
      run = run,
    },
    active_animation = "walk",
    x = props.x,
    y = props.y,
  })

  return setmetatable({
    x = props.x,
    y = props.y,
    sprite = sprite,
  }, M)
end

function M:update(dt)
  self.sprite.x = self.x
  self.sprite.y = self.y
  self.sprite:update(dt)
end

function M:draw()
  love.graphics.rectangle('fill', self.x, self.y, 20, 80)
  self.sprite:draw()
end

function M:play(animation)
  self.sprite:play(animation)
end

return M

