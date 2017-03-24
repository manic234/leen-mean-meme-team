function love.load()
	love.window.setTitle("Leen Mean Meme Team")
	lb       = require "lib.lovebird"
	gui      = require "lib.gui"
	config   = require "lib.config"
	physics  = love.physics
	graphics = love.graphics
	keyboard = love.keyboard
end

function love.update(dt)
	lb.update()
end

function love.draw()
end