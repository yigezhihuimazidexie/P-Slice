function onEvent(name, value1, value2)
	if name == 'badapplelol' and value1 == 'a' then
		makeLuaSprite('whitebg', '', -500, -300)
		makeGraphic('whitebg',5000,5000,'FFFFFF')
		addLuaSprite('whitebg', false)
		setProperty('boyfriend.color', getColorFromHex('000000'))
		setProperty('dad.color', getColorFromHex('000000'))
		setProperty('gf.color', getColorFromHex('000000'))
		setProperty('iconP1.color', getColorFromHex('000000'))
		setProperty('iconP2.color', getColorFromHex('000000'))
		setProperty('healthBar.color', getColorFromHex('000000'))
	end
	if name == 'badapplelol' and value1 == 'b' then
		removeLuaSprite('whitebg')
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
		setProperty('iconP1.color', getColorFromHex('FFFFFF'))
		setProperty('iconP2.color', getColorFromHex('FFFFFF'))
		setProperty('healthBar.color', getColorFromHex('FFFFFF'))
	end
end