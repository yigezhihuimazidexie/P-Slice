function onEvent(name,value1,value2)
	if name == 'MONK' then	
		if value1 == '1' then
        setProperty('BG5.visible', true)
        setProperty('BG5.visible', true)
        setProperty('BG6.visible', true)
        setProperty('BG7.visible', true)
        setProperty('BG8.visible', true)
        setProperty('BG9.visible', true)
		end
		if value1 == '2' then
        setProperty('BG5.visible', false)
        setProperty('BG6.visible', false)
        setProperty('BG7.visible', false)
        setProperty('BG8.visible', false)
        setProperty('BG9.visible', false)
		end
           end
end		