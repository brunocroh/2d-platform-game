local Sprite = require('lib.sprite')
local M = {}

M.__index = M

function M:new(props)

  local walk = {}
  local run = {}
  local idle = {}

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

  for i = 1, 7, 1 do
    table.insert(
      idle,
      love.graphics.newImage(string.format('assets/common_00_idle_stand_A%02d.png', i))
    )
  end

  local sprite = Sprite:new({
    files = {
      walk = walk,
      run = run,
      idle = idle,
    },
    active_animation = "idle",
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
  if self.key_pressed == 'd' then
    self.sprite.mirror = false
  end

  if self.key_pressed == 'a' then
    self.sprite.mirror = true
  end



  self.sprite.x = self.x
  self.sprite.y = self.y
  self.sprite:update(dt)
end

function M:draw()
  love.graphics.rectangle('fill', self.x, self.y, 20, 80)
  self.sprite:draw()
end

function M:keypressed(key)
  self.sprite:play("walk")
  self.key_pressed = key
end

function M:keyreleased()
  self.sprite:play("idle")
  self.key_pressed = nil
end


function M:play(animation)
  self.sprite:play(animation)
end

return M

