function onEvent(name,value1,value2)
	if name == 'ER' then	
		if value1 == '1' then
        setProperty('7.visible', true)
		end
		if value1 == '2' then
        setProperty('7.visible', false)
		end
           end
end		