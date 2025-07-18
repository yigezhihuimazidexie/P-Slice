function onEvent(name,value1,value2)
	if name == 'an' then	
		if value1 == '1' then
        setProperty('C1.visible', true)
		end
		if value1 == '2' then
        setProperty('C1.visible', false)
		end
           end
end		