function onEvent(name,value1,value2)
	if name == 'MONK2' then	
		if value1 == '1' then
		setProperty('5.visible', true)
		setProperty('8.visible', true)
		end
		if value1 == '2' then
		setProperty('5.visible', false)
		setProperty('8.visible', false)
		end
		if value2 == 'a' then
		setProperty('7.visible', true)
		end
		if value2 == 'b' then
		setProperty('7.visible', false)
        end
end
end