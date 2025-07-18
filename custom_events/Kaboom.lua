local angleshit = 1;
local anglevar = 1;
local intensity = 0
local intensity2 = 3
local enabled = false
function onBeatHit()
	
		if enabled then 

		if curBeat % 2 == 0 then
			angleshit = angleshit;
		else
			angleshit = -angleshit;
		end
		--setProperty('camHUD.angle',angleshit*intensity2)
		--setProperty('camGame.angle',angleshit*intensity2)
		--doTweenAngle('turn', 'camHUD', angleshit*intensity, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', 10*angleshit*intensity, crochet*0.001, 'linear')
		--doTweenAngle('tt', 'camGame', angleshit*intensity, stepCrochet*0.002, 'circOut')
		doTweenX('ttrn', 'camGame', 2*angleshit*intensity, crochet*0.001, 'linear')

		end
end

function onStepHit()
if enabled then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -6*intensity2, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame', 12, stepCrochet*0.002, 'circOut')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'circIn')
			doTweenY('ryr', 'camGame', 0, stepCrochet*0.002, 'circIn')
		end
		end
end


function onEvent(n,v,b)
	if n == 'Kaboom' then
	enabled = true
		intensity = tonumber(v)
		intensity2 = tonumber(b)
		if tonumber(b) == 0 then 
		enabled = false
		
		doTweenAngle('gg','camHUD',0,1,'sineInOut')
		doTweenAngle('gg2','camGame',0,1,'sineInOut')
		 
		doTweenX('gg3','camHUD',0,1,'sineInOut')
		doTweenX('gg4','camGame',0,1,'sineInOut')
		end
	end
end