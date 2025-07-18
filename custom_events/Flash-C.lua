function onCreatePost()
	makeLuaSprite('Flash', 'Flash', 0, 0);
	setScrollFactor('Flash', 0, 0);
	setProperty('Flash.alpha', 0.001);
	setObjectCamera('Flash', 'camHUD');
	addLuaSprite('Flash', false);
end

function onEvent(name, value1, value2) 
	if name == 'Flash-C' then
		setProperty('Flash.alpha', 1);
		doTweenAlpha('Flash', 'Flash', 0, 0.5, 'linear')
	end
end