Game = {}

Game.__index = Game

local Player = require "player"

function Game:load()
  local player = Player:new({
    x = 100,
    y = 100,
  })
  Game = setmetatable({
    player = player,
  }, Game)
end

function Game:update(dt)
  self.player:update(dt)
end

function Game:draw()
  self.player:draw()
end

function Game:keypressed()
  self.player:play('run')
end

function Game:keyreleased()
end

function Game:mousepressed(x, y, btn)
  print(x,y,btn)
end

function Game:mousereleased(x, y, btn)
  print(x,y,btn)
end
