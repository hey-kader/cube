Cube = require "cube"

function love.load ()
    cube = Cube()
		center = {
			x=love.graphics.getWidth()/2,
			y=love.graphics.getHeight()/2
		}
    cube:load (64, center.x-32, center.y-32)
end

function love.update (dt)
   cube:update(dt)
	 if love.keyboard.isDown('q') then
		 love.event.quit ('1')
	 end
end
function grid ()
	local grid = love.graphics.newCanvas(1024, 1024)
	love.graphics.setCanvas(grid)
	_x, _y = (love.graphics.getWidth()/2), (love.graphics.getHeight()/2)-grid:getHeight()/2
	for x=1,4 do
		for y=1,4 do
			love.graphics.draw(cube.canvas, _x+((x*64)/2+(y*32)), _y+(((y*32)-(x*64)/2))/2)
		end
	end
	love.graphics.setCanvas()
	return grid
end

function love.draw ()
   --cube:draw()
	 g = grid()
	 love.graphics.draw(g)

 end
