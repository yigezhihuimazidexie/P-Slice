function onEvent(name,value1,value2)
	if name == 'NMSL' then	
		if value1 == '1' then
        setProperty('MINI.visible', true)
		end
		if value1 == '2' then
        setProperty('MINI.visible', false)
		end
           end
end		