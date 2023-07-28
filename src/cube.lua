cube = {}
cube.mt = {}

setmetatable(cube, cube.mt)
function cube.mt:__call ()
   local cube = {
		 kern = {
			 width = 1
		 }
	 } 
   function cube:load (size)
    if size then
        cube.canvas = love.graphics.newCanvas(size, size) 
    else
        cube.canvas = love.graphics.newCanvas(32, 32) 
    end
		love.graphics.setLineWidth(cube.kern.width)
   cube.points = {
        {
					x = cube.canvas:getWidth()/2,
					y = 0 
        },
        {
					x = cube.canvas:getWidth(),
					y = cube.canvas:getHeight()/4
				},
        {
					x = cube.canvas:getWidth()/2,
					y = cube.canvas:getHeight()/2
        },
        {
					x = 0,
					y = cube.canvas:getHeight()/4
        },
				{
					x = cube.canvas:getHeight()/2,
					y = 0
				},
				{
					x = cube.canvas:getWidth()/2,
					y = 0
				},
				{
					x = cube.canvas:getWidth()/2,
					y = cube.canvas:getHeight()/2
				},
				{
					x = cube.canvas:getWidth()/2,
					y = cube.canvas:getHeight()
				},
				{
					x = 0,
					y = cube.canvas:getHeight()-cube.canvas:getHeight()/4
				},
				{
					x = 0,
					y = cube.canvas:getHeight()/4
				},
   }
   end
   function cube:render ()
    love.graphics.setCanvas(cube.canvas)
		pool = {}
		for i=1, #cube.points - 1 do
			love.graphics.line(cube.points[i].x, cube.points[i].y, cube.points[i+1].x, cube.points[i+1].y)
		end
    love.graphics.setCanvas()
   end

   function cube:update (dt)
			cube:render()
   end

   function cube:draw()
			love.graphics.draw(cube.canvas)
   end
   return cube
end

return cube
