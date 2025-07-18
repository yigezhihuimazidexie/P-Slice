function onEvent(name,value1,value2)
	if name == 'RT' then	
		if value1 == '1' then
        setProperty('8.visible', true)
		end
		if value1 == '2' then
        setProperty('8.visible', false)
		end
           end
end		