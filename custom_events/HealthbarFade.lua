
function onEvent(name, value1, value2, elapsed)
	if name == 'HealthbarFade' then
	
	doTweenAlpha('healthBartween', 'healthBar', (value2), (value1), 'linear');
	doTweenAlpha('iconP2tween', 'iconP2', (value2), (value1), 'linear');
	doTweenAlpha('iconP1tween', 'iconP1', (value2), (value1), 'linear');
	doTweenAlpha('scoreTxttween', 'scoreTxt', (value2), (value1), 'linear');
		
	
		if value2 == '' then
	doTweenAlpha('healthBartween', 'healthBar', 0, (value1), 'linear');
	doTweenAlpha('iconP2tween', 'iconP2', 0, (value1), 'linear');
	doTweenAlpha('iconP1tween', 'iconP1', 0, (value1), 'linear');
	doTweenAlpha('scoreTxttween', 'scoreTxt', 0, (value1), 'linear');
	

	
				end
			end
		end	
