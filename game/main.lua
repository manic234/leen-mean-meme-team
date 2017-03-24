function love.load()
	love.window.setTitle("Leen Mean Meme Team")
	lb = require "lib.lovebird"
	physics = love.physics
	graphics = love.graphics
	keyboard = love.keyboard
end

function love.update(dt)
	lb.update()
end

function love.draw()
end