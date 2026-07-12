local d = require('dev-tools')
require "game"


function love.load()
  d:load()
  Game:load()
end

function love.update(dt)
  Game:update(dt)
end

function love.draw()
  Game:draw()
end

function love.quit()
  d:quit()
end
