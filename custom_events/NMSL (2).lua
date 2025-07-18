function onEvent(name,value1,value2)
	if name == 'mini' then	
		if value1 == '1' then
        setProperty('2.visible', true)
		end
		if value1 == '2' then
        setProperty('2.visible', false)
		end
           end	          	                              
end		