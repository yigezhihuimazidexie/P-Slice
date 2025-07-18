function onEvent(name, value1, value2)
	if name == 'mirrorAngle' then
				time = tonumber(value2) --converts Duration to number

		--tweenstuffs
		varNum = getProperty('mirror.x')
		if x == varNum then
			return
		else
			doTweenX('X', 'mirror', value1, time, 'backOut')
			updateShader()
		end
	end
end