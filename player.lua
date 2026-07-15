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

  local offset_x = 115
  local offset_y = 120

  local sprite = Sprite:new({
    files = {
      walk = walk,
      run = run,
      idle = idle,
    },
    active_animation = "idle",
    x = props.x - offset_x,
    y = props.y - offset_y,
  })

  return setmetatable({
    x = props.x,
    y = props.y,
    speed = 3,
    jump_speed = 200,
    ax = 2.5,
    ay = 200,
    dx = 0,
    dy = 0,
    sprite = sprite,
    width = 35,
    height = 120,
    offset_x = offset_x,
    offset_y = offset_y,
    on_ground = false,
  }, M)
end

function M:update(dt)
  local x, y = self.x, self.y
  if self.key_pressed == 'd' then
    self.dx = math.min(self.dx + self.ax * dt, self.speed)
    self.sprite.mirror = false
  elseif self.key_pressed == 'a' then
    self.dx = math.max(self.dx - self.ax * dt, -self.speed)
    self.sprite.mirror = true
  else
    self.dx = 0
    -- implement desaceleration
  end

  if self.on_ground then
    if love.keyboard.isDown("space") then
      print("jump")
      self.dy = -self.jump_speed
    end
  else
    self.dy = self.dy + (self.ay*dt)
  end

  self.x = x+self.dx
  local prev = y + (self.dy*dt)
  print(prev, self.y)
  self.y = prev

  self.sprite.x = self.x - self.offset_x
  self.sprite.y = self.y - self.offset_y
  self.sprite:update(dt)
end

function M:draw()
  self.sprite:draw()
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

function M:keypressed(key)
  self.sprite:play("run")
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

