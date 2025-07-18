function onCreate()
	makeAnimatedLuaSprite('YounTai', 'YounTai',250,280);
	scaleObject('YounTai',0.8, 0.8);
	addAnimationByPrefix('YounTai', 'idle', 'idle', 24, false);
	      addLuaSprite('YounTai', false)
end
function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('YounTai', 'idle', false)
    end
end
function onCountdownTick(counter)
    if counter % 2 == 0 then
        objectPlayAnimation('YounTai', 'idle', false)
    end
end
function onStepHit()
    if curStep == 50 then
        -- 删除该行代码
        -- objectRemove(currentObject)
        -- removeLuaSprite('YounTai',false)
    end
end