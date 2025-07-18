function onEvent(name,value1,value2)
	if name == 'QE' then	
		if value1 == '1' then
        setProperty('6.visible', true)
		end
		if value1 == '2' then
        setProperty('6.visible', false)
		end
           end
end		