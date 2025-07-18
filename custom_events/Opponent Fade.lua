function onEvent(name, value1, value2)
	if name == 'Opponent Fade' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
			setProperty('gf.alpha', targetAlpha);
		else
			doTweenAlpha('FadeEventTween', 'girlfriend', 0, 1, linear)
		end
	end
end