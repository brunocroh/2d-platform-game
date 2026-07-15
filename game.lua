local Player = require "player"
local Map = require "map"

Game = {}

Game.__index = Game

function Game:load()

  local player = Player:new({
    x = 100,
    y = 100,
  })

  local game_map = Map:new({
    player = player,
  })

  Game = setmetatable({
    player = player,
    map = game_map
  }, Game)
end

function Game:update(dt)
  self.player:update(dt)
  self.map:update(dt)
end

function Game:draw()
  self.player:draw()
  self.map:draw()
end

function Game:keypressed(key)
  self.player:keypressed(key)
end

function Game:keyreleased(key)
  self.player:keyreleased(key)
end

function Game:mousepressed()
end

function Game:mousereleased()
end
