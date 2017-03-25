platform = {}
player = {}

function love.load()
	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()

	platform.x = 0
	platform.y = platform.height / 2

	player.x = love.graphics.getWidth() / 2
	player.y = love.graphics.getHeight() / 2

	player.speed = 200

	player.img = love.graphics.newImage('purple.png')
end

function love.update (dt)
	if love.keyboard.isDown('d') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elsif love.keyboard.isDown('a') then
		if player.x > 0 then
			player.x = player.x - (player.speed * dt)
		end
end

function love.draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)
	
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
end