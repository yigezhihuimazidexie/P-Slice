function onCreate()
	makeAnimatedLuaSprite('YounTai', 'YounTai',100,300);
	scaleObject('YounTai',0.8, 0.8);
	addAnimationByPrefix('YounTai', 'idle', 'idle', 24, false);
	addLuaSprite('YounTai', false)
	setProperty('YounTai.visible', false) -- 初始隐藏
end

function onBeatHit()
    if curBeat % 2 == 0 and getProperty('YounTai.visible') then -- 只在可见时播放
        objectPlayAnimation('YounTai', 'idle', false)
    end
end

function onCountdownTick(counter)
    if counter % 2 == 0 and getProperty('YounTai.visible') then -- 只在可见时播放
        objectPlayAnimation('YounTai', 'idle', false)
    end
end

function onStepHit()
    if curStep == 656 then
        setProperty('YounTai.visible', true) -- 开启显示
        objectPlayAnimation('YounTai', 'idle', true) -- 强制播放一次动画
    end
end