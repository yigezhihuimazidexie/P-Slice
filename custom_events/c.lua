function onEvent(name,value1,value2)
	if name == 'c' then	
		if value1 == '1' then
        setProperty('C2.visible', true)
		end
		if value1 == '2' then
        setProperty('C2.visible', false)
		end
           end
end		