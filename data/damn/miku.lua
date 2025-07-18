function onCreate()
    precacheImage('mikuanim')
    precacheImage('logomiku_bg')

    makeLuaSprite('logomiku_bg', 'logomiku_bg', -400, 400)
    setProperty('logomiku_bg.alpha', 0) 
    scaleObject('logomiku_bg', 0.2, 0.3);
    setObjectCamera('logomiku_bg', 'hud')
    addLuaSprite('logomiku_bg', false)
    setProperty('healthBar.visible', true)

    makeAnimatedLuaSprite('mikuanim', 'mikuanim', -400, 350)
    addAnimationByPrefix('mikuanim', 'anim', 'mikulogo', 24, true)
    setProperty('mikuanim.alpha', 0) 
    scaleObject('mikuanim', 0.3, 0.3);
    setProperty('mikuanim.flipX', true)
    setObjectCamera('mikuanim', 'hud')
    addLuaSprite('mikuanim', true)
    setProperty('healthBar.visible', true)

    setObjectOrder('logomiku_bg', getObjectOrder('mikuanim') - 2)
end

local ENTER_STEP = 1023   
local EXIT_STEP = 1280  

function onStepHit()
    if curStep == ENTER_STEP then
        setProperty('logomiku_bg.alpha', 1)
        setProperty('mikuanim.alpha', 1)
        doTweenX('bgIn', 'logomiku_bg', -100, 1.2, 'quadOut')
        doTweenX('animIn', 'mikuanim', -50, 1.2, 'quadOut')
        
    elseif curStep == EXIT_STEP then
        doTweenX('bgOut', 'logomiku_bg', -1500, 1.2, 'quadIn')
        doTweenX('animOut', 'mikuanim', -1500, 1.2, 'quadIn')
        runTimer('hideSprites', 1.2)
    end
end

function onTimerCompleted(tag)
    if tag == 'hideSprites' then
        setProperty('logomiku_bg.alpha', 0)
        setProperty('mikuanim.alpha', 0)
    end
end