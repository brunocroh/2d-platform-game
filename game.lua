Game = {}

local Player = require "player"


function Game:load()
  Game.player = Player:new({
    x = 100,
    y = 100,
  })
end

function Game:update(dt)
  self.player:update(dt)
end

function Game:draw()
  self.player:draw()
end

