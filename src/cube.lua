cube = {}
cube.mt = {}

setmetatable(cube, cube.mt)
function cube.mt:__call ()
   local cube = {
		 kern = {
			 width = 1
		 },
		 style = "smooth",
		 position = {
			 x = love.graphics.getWidth()/2,
			 y = love.graphics.getHeight()/2 
		 }
	 } 
   function cube:load (size)
    if size then
        cube.canvas = love.graphics.newCanvas(size, size) 
    else
        cube.canvas = love.graphics.newCanvas(32, 32) 
    end
		love.graphics.setLineWidth(cube.kern.width)
		love.graphics.setLineStyle(cube.style)
		cube.position.x = cube.position.x - cube.canvas:getWidth()/2
		cube.position.y = cube.position.y - cube.canvas:getHeight()/2

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
					x = cube.canvas:getWidth()/2,
					y = 0
				}
		 }
   end
   function cube:render ()
    love.graphics.setCanvas(cube.canvas)
		pool = {}
		for i=1, #cube.points - 1 do
			love.graphics.line(cube.points[i].x, cube.points[i].y, cube.points[i+1].x, cube.points[i+1].y)
		end
	 local polygon = {}
	 for i=1, 4 do
		 table.insert(polygon, cube.points[i].x)
		 table.insert(polygon, cube.points[i].y)
	 end
	  --love.graphics.polygon('fill', polygon)
    love.graphics.setCanvas()
   end

   function cube:update (dt)
			cube:render()
   end

   function cube:draw()
		 for i=1, 4 do
			 love.graphics.print (cube.points[i].x .. ', '..cube.points[i].y, 0, i*13)
		 end
		 love.graphics.draw(cube.canvas, cube.position.x, cube.position.y)
   end
   return cube
end

return cube
