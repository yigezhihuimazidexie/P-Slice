function onCreate()
    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', screenWidth * 2, screenHeight * 2, '000000') 
    setObjectCamera('black', 'other') 
    addLuaSprite('black', true) 
    setProperty('black.alpha', 0)
end

function onStepHit()
    if curStep == 1440 then 
        doTweenAlpha('blackFadeIn', 'black', 1, 1, 'linear') 
        runTimer('fadeOutBlack', 40) 
    end
end

function onTimerCompleted(tag)
    if tag == 'fadeOutBlack' then
        doTweenAlpha('blackFadeOut', 'black', 0, 5, 'linear') 
    end
end