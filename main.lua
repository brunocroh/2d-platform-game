local d = require('dev-tools')
require "game"

SCALE = 1.5

function love.load()
  love.window.setMode(1920, 1080)
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

function love.keypressed(key)
  if key == 'r' then love.event.quit('restart') end
  if key == 'escape' then
    Game = Game:new()
    Game:load()
  end
  Game:keypressed()
end

function love.keyreleased(key)
  Game:keyreleased()
end

function love.mousepressed(x, y, btn)
  Game:mousepressed(x, y, btn)
end

function love.mousereleased(x, y, btn)
  Game:mousereleased(x, y, btn)
end
