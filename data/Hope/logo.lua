function onCreate()
    -- 创建死鱼图片（开局隐藏）
    makeLuaSprite('deadFish', 'logo/StrandedCARP死鱼', -1000, 300)
    setScrollFactor('deadFish', 0, 0)
    scaleObject('deadFish', 1, 1)
    setProperty('deadFish.visible', false)
    addLuaSprite('deadFish', true)
end

function onStepHit()
    if curStep == 256 then
        setProperty('deadFish.visible', true)
        setProperty('deadFish.x', -1500)
        doTweenX('fishSlideIn', 'deadFish', -280, 2, 'sineOut') 
    end
    
    if curStep == 300 then
        doTweenX('fishSlideOut', 'deadFish', -5500, 2, 'sineIn')
    end
end