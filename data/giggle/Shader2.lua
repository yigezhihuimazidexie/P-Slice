local defaultCamZoom = 1
local opponentPlay = false
function onCreatePost()
    callShader('createShader',{'greyscale', 'GreyscaleEffect'})
    callShader('runShader',{{'camGame','camHUD', 'camOther'},'greyscale'})
    shaderVar('greyscale', 'strength', 0.5)

    
    callShader('createShader',{'scanline', 'ScanlineEffect'})
    callShader('runShader',{{'camGame','camHUD', 'camOther'},'scanline'})
    shaderVar('scanline', 'strength', 1)

    callShader('createShader',{'ca', 'ChromAbEffect'})
    callShader('runShader',{{'camGame','camHUD', 'camOther'},'ca'})

    callShader('createShader',{'mirror', 'MirrorRepeatEffect'})
    callShader('runShader',{'camGame','mirror'})
    shaderVar('mirror', 'zoom', 1)
    shaderVar('mirror', 'angle', -30)

    callShader('createShader',{'blur', 'BlurEffect'})
    callShader('runShader',{{'camGame','camHUD', 'camOther'},'blur'})
    shaderVar('blur', 'strength', 3)

    callShader('createShader',{'bloom2', 'BloomEffect'})
    callShader('runShader',{{'camGame','camHUD', 'camOther'},'bloom2'})

    --[[initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')



    setCameraShader('hud', 'smoke')
    shaderVar('smoke', 'waveStrength', 0.02)]]--
    if not opponentPlay then
        makeLuaSprite('black', '', 0, 0, 1)
        setObjectCamera('black', 'hud')
        makeGraphic('black', 4000, 2000, '000000')
        --setProperty('black.alpha',0.0001)
        addLuaSprite('black',false)
    end
end
function callShader(func,vars)
    callScript('scripts/shader',func,vars)
end
function shaderVar(shader,var,value,type)
    callShader('setShaderVar',{shader,var,value,type})
end
function shaderTween(shader,var,value,time,easing)
    callShader('tweenShaderValue',{shader,var,value,time,easing})
end
function onStepHit()
    if curStep == 64 then
        shaderVar('blur','strength',0)
        shaderVar('greyscale','strength',0)
        shaderVar('scanline','strength',0)
    end
    if curStep == 320 then
        shaderVar('blur','strength',1.4)
        shaderVar('scanline','strength',0.5)
        shaderVar('greyscale','strength',1)
    end
    if curStep == 383 then
        shaderVar('blur','strength',0.5)
        shaderVar('scanline','strength',0)
        shaderVar('greyscale','strength',0.4)
    end
    if curStep == 408 then
        shaderVar('blur','strength',5)
        shaderVar('scanline','strength',1)
        shaderVar('greyscale','strength',1)
    end
    if curStep == 412 then
        shaderVar('blur','strength',0)
        shaderVar('scanline','strength',0)
        shaderVar('greyscale','strength',0)
    end
    if curStep == 512 then
        shaderVar('blur','strength',2)
        shaderVar('scanline','strength',1)
        shaderVar('greyscale','strength',1)
    end
    if curStep == 11030 then
if not downscroll then
setProperty('target.y',-1000)
setProperty('ScoreMadness.y',355)
setProperty('boyfriend.y',145)
setProperty('dad.y',145)
doTweenY("bsgs", "target", -485, 1, "quartOut")
end
if downscroll then
setProperty('target.y', 1000)
setProperty('ScoreMadness.y',355)
doTweenY("hqfst", "target", -110, 1, "quartOut")
end
shaderTween('mirror', 'x', 0, stepCrochet*0.001*0.01, 'linear')
doTweenAlpha("hfhfh", "bgawa", 1, 1, "linear")
doTweenAlpha("hfhhghgfh", "bgawa2", 1, 1, "linear")
doTweenAlpha("hhhghgfh", "bgawa3", 1, 1, "linear")
doTweenAlpha("jwgsg", "camGame", 5, 1, "linear")
doTweenY("jwgs", "front2", 0, 1, "quartOut")
setProperwty('bgawa.scale.y',2.3)
setProperty('bgawa.scale.x',1.8)
setProperty('bgawa2.scale.y',1.3)
setProperty('bgawa2.scale.x',1.3)
setObjectOrder('bgawa',11);
setObjectOrder('bgawa2',12);
setObjectOrder('boyfriendGroup',13);
setProperty('bgawa2.scale.y',1.3)
setProperty('healthBar.y',365)
noteTweenAlpha('note hsg', 0, 0.1, 1, 'linear')
noteTweenAlpha('note hafa', 1, 0.1, 1, 'linear')
noteTweenAlpha('note hafaf', 2, 0.1, 1, 'linear')
noteTweenAlpha('note gqdqef', 3, 0.1, 1, 'linear')
setPropertyFromGroup('playerStrums', 0, 'x', 370)
setPropertyFromGroup('playerStrums', 1, 'x', 503)
setPropertyFromGroup('playerStrums', 2, 'x', 641)
setPropertyFromGroup('playerStrums', 3, 'x', 775)
    setPropertyFromGroup('opponentStrums', 0, 'alpha', 0.15)
	setPropertyFromGroup('opponentStrums', 1, 'alpha', 0.15)
	setPropertyFromGroup('opponentStrums', 2, 'alpha', 0.15)
	setPropertyFromGroup('opponentStrums', 3, 'alpha', 0.15)
    end
end

function bloomBurst()
    shaderVar('bloom2', 'effect', 0.25)
    shaderVar('bloom2', 'strength', 3)
    shaderVar('ca', 'strength', 0.005)
    shaderTween('bloom2', 'effect', 0, stepCrochet*0.001*16, 'cubeOut')
    shaderTween('bloom2', 'strength', 0, stepCrochet*0.001*16, 'cubeOut')
    shaderTween('ca', 'strength', 0, stepCrochet*0.001*16, 'cubeOut')
end


function onSongStart()
    --shaderTween('blur', 'strength', 2, stepCrochet*0.001*16*2, 'cubeOut')
    if curStep == 0 then
        shaderTween('mirror', 'angle', 0, stepCrochet*0.001*16*2, 'cubeOut')
        doTweenAlpha('black','black', 0, stepCrochet*0.001*16*4, 'cubeOut')
    else
        shaderVar('blur','strength',0)
        shaderVar('greyscale','strength',0)
        shaderVar('mirror','angle',0)
        setProperty('black.alpha',0)
    end
end

function onTweenCompleted(t)
	if t == 'REMIX' then
doTweenY('REMIX1', 'bgawa', -0, 0.01, 'linear');
	end
	if t == 'REMIX1' then
doTweenY('REMIX', 'bgawa', -251, 0.5, 'linear');
	end

	if t == 'REMIX2' then
doTweenX('REMIX3', 'bgawa3', -1008, 0.01, 'linear');
	end
	if t == 'REMIX3' then
doTweenX('REMIX2', 'bgawa3', 0, 1.5, 'linear');
	end
end