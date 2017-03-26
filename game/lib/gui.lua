gui = {buttons={},labels={},other={},useImage=false,backgroundImage=nil,backgroundColor={0,0,0}}

function gui.button(X,Y,I)
	return {type="button",x=X,y=Y,image=I}
end

function gui.label(X,Y,T)
	return {type="label",x=X,y=Y,text=T}
end

function gui.push(i)
	if i.type == "button" then
		table.insert(gui.buttons,i)
	elseif i.type == "label" then
		table.insert(gui.labels,i)
	else
		table.insert(gui.other,i)
	end
end

function gui.setBackgroundColor(r,g,b)
	gui.useImage = false
	gui.backgroundColor = {r,g,b}
end

function gui.setBackgroundImage(img)
	gui.useImage = true
	gui.backgroundImage = img
end

function gui.drawBackground(i)
	if i then
		love.graphics.draw(gui.backgroundImage,0,0)
	else
		love.graphics.setBackgroundColor(gui.backgroundColor[1],gui.backgroundColor[2],gui.backgroundColor[3])
	end
end

function gui.drawButtons()
end

function gui.drawLabels()
end

function gui.draw()
	gui.drawBackground(gui.useImage)
	gui.drawButtons()
	gui.drawLabels()
end

return gui