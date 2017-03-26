physics = {__version = 0.1}
physmeta = {}

function physics.collide(a,b)
	if a.name == b.name then
		return false
	end
	return a.x < b.x + b.w and a.x + a.w > b.x and a.y < b.y + b.h and a.h + a.y > b.y
end

function physics.setControls(obj,cnt)
	if not type(obj) == "kinetic object" then error("This only works with kinetic object, moron!"); return; end
	obj.controls = cnt
end

function physics.setPosition(obj,v)
	obj.velocity,obj.delta = {0,0},{0,0}
	obj.x = v[1]
	obj.y = v[2]
	return obj
end

function physics.move(obj,v)
	obj.delta = v
	obj.x = obj.x + v[1]
	obj.y = obj.y + v[2]
	return obj
end

function physics.draw(obj)
	if obj.image then
		love.graphics.draw(obj.image,obj.x,obj.y)
	else
		love.graphics.setColor(math.random(0,255),math.random(0,255),math.random(0,255))
		love.graphics.rectangle("fill",obj.x,obj.y,obj.w,obj.h)
	end
end

function physics.setImage(obj,img)
	obj.image = img
end

function physics.update(obj,tiles)
	if type(obj) == "kinetic object" then
		if obj.controls then
			obj = obj + {obj.controls(12)/256}
		end

		for _,t in pairs(tiles) do
			if physics.collide(obj,t) then
				obj = obj - obj.delta
			end
		end
	else
		error("This function can only be used on a kinetic object, asshole!")
	end
end

  --[[ Physics Metatable ]]--

function physmeta.__call(o)
	return physics.collide(self,o)
end

function physmeta.__add(self,v)
	return physics.move(self,v)
end

function physmeta.__mult(self,v)
	return physics.setPosition(self,v)
end

--[[ End Physics Metatable ]]--

function physics.static(X,Y,W,H,I)
	physmeta.__type = "static object"
	return setmetatable({x=X,y=Y,w=W,h=H,image=I,velocity={0,0},delta={0,0}},physmeta)
end

function physics.kinetic(X,Y,W,H,I,N)
	physmeta.__type = "kinetic object"
	physmeta.setControls = physics.setControls
	return setmetatable({x=X,y=Y,w=W,h=H,image=I,name=N,controls=nil,velocity={0,0},delta={0,0}},physmeta)
end

function physics.new(X,Y,W,H,I,N)
	if not n then
		physics.static(X,Y,W,H,I)
	else
		physics.kinetic(X,Y,W,H,I,N)
	end
end

return physics