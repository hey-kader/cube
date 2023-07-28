Cube = require "cube"

function love.load ()
    cube = Cube()
    cube:load (64)
end

function love.update (dt)
   cube:update(dt)
	 if love.keyboard.isDown('q') then
		 love.event.quit ('1')
	 end
end

function love.draw ()
   cube:draw()
 end
