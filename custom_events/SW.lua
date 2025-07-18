function onEvent(name,value1,value2)
	if name == 'SW' then	
		if value1 == '1' then
        setProperty('5.visible', true)
		end
		if value1 == '2' then
        setProperty('5.visible', false)
		end
           end
end		