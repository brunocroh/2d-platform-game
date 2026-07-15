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

function Game:keypressed(key)
  print(key)
  self.player:keypressed(key)
end

function Game:keyreleased(key)
  self.player:keyreleased(key)
end

function Game:mousepressed()
end

function Game:mousereleased()
end
