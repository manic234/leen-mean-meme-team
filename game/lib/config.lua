config = {}

function config.load(file)
	sep = "="
	f = io.open("assets/config/"..file..".txt","r")
	input = f:read()
	local t={}
	while input ~= nil do
		F = string.gmatch(input, "([^"..sep.."]+)")
		t[F()] = F()
		input = f:read()
	end
	return t
end

function config.getValue(t,val)
	return t[val]
end

function config.setValue(t,val,set)
	t[val] = set
end

function config.save(t,file)
	f = io.open("assets/config/"..file..".txt","w")
	for i,j in pairs(t) do
		f:write(i.."="..j.."\n")
	end
	f:close()
end

return config