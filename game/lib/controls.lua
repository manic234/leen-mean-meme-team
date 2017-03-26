controls = {}
cntmeta = {}

function cntmeta.__call(iter)
	return self[iter]()
end


--[[
	Controls argument layout:
		1. Attack
		2. Special
		3. Jump1
		4. Jump2
		5. Shield1
		6. Shield2
		7. Pause
		8. TauntUp
		9. TauntDown
	   10. TauntLeft
	   11. TauntRight
	   12. MovementAnalog
	   13. C-Stick
	   14. C-Stick Function (1 to 12)
	All arguments are functions for determining input (except for 14)
  ]]
function controls.new(...)
	args = {...}
	if type(args[1]) == "table" then
		return setmetatable(args[1],cntmeta)
	end
	return setmetatable({...},cntmeta)
end

function controls.check(cnt)
	buttons = {cnt[1](),cnt[2](),cnt[3](),cnt[4](),cnt[5](),cnt[6](),cnt[7](),cnt[8](),cnt[9](),cnt[10](),cnt[11]()}
	analog = {{cnt[12]()},{cnt[13]()}}
	return analog,buttons
end

return setmetatable(controls,{__call=controls.new})