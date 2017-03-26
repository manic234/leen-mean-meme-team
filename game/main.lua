function love.load()
	love.window.setTitle("Leen Mean Meme Team")
	lb       = require "lib.lovebird"
	gui      = require "lib.gui"
	config   = require "lib.config"
	physics  = require "lib.physics"
	controls = require "lib.controls"
	graphics = love.graphics
	keyboard = love.keyboard
	locale = config.load("locale")

	wWidth,wHeight = love.window.getMode()

	players = {physics.kinetic(0,0,48,48,nil,"player1")}
	terrain = {physics.static(0,wHeight-64,wWidth,64,nil)}
end

function love.update(dt)
	lb.update()
end

function love.draw()
	physics.draw(players[1])
	physics.draw(terrain[1])
end