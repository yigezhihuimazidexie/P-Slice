function onEvent(name,value1,value2)
	if name == 'n' then	
		if value1 == '1' then
        setProperty('C4.visible', true)
		end
		if value1 == '2' then
        setProperty('C4.visible', false)
		end
          end
end		