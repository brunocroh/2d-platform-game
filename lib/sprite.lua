local M = {}

M.__index = M

function M:new(options)
  local frames = options.files[options.active_animation]

  local width = frames[1]:getWidth()
  local height = frames[1]:getHeight()

  return setmetatable({
    x = options.x,
    y = options.y,
    width = width,
    height = height,
    mirror = false,
    files = options.files,
    active_animation = options.active_animation,
    animation = {
      is_playing = true,
      frames = #frames,
      current_frame = 1,
      duration = 0.065,
      elapsed_time = 0
    }
  }, M)
end

function M:update(dt)
  local ani = self.animation
  if ani.elapsed_time >= ani.duration then
    ani.current_frame = ((ani.current_frame) % ani.frames) + 1
    ani.elapsed_time = 0
  else
    ani.elapsed_time = ani.elapsed_time + dt
  end

end


function M:draw()
  local frame = self.files[self.active_animation][self.animation.current_frame]
  local x = self.x
  local y = self.y

  local ox = 1
  if self.mirror then
    ox = -1
    x = x + self.width
  end


  love.graphics.draw(frame, (x+400), y, 0, ox, 1)
end

function M:play(animation_name)
  local animation = self.files[animation_name]
  self.active_animation = animation_name
  self.animation.frames = #animation
  self.animation.current_frame = 1
  self.animation.elapsed_time = 0
end


return M
