function onCreate()
    setProperty('defaultCamZoom', 0.7)
    
    dadPos = {x = 750, y = 520}
    bfPos = {x = 1700, y = 650}
    gfPos = {x = 1200, y = 150}
end

function onStepHit()
    if curStep == 32 then
        cancelTween('camStartMoveX')
        cancelTween('camStartMoveY')
        setProperty('isCameraOnForcedPos', true)
        doTweenX('camMoveToDadX', 'camFollow', dadPos.x, 2, 'sineInOut')
        doTweenY('camMoveToDadY', 'camFollow', dadPos.y, 2, 'sineInOut')
        
    elseif curStep == 64 then
        setProperty('isCameraOnForcedPos', true)
        doTweenX('camMoveToGFX', 'camFollow', gfPos.x, 2, 'sineInOut')
        doTweenY('camMoveToGFY', 'camFollow', gfPos.y, 2, 'sineInOut')
        doTweenZoom('camZoomToGF', 'camGame', 0.8, 5, 'sineOut')
        
    elseif curStep == 96 then
        doTweenX('camMoveToBF', 'camFollow', bfPos.x, 2.5, 'sineInOut')
        doTweenY('camMoveToBFY', 'camFollow', bfPos.y, 2.5, 'sineInOut')
        
    elseif curStep == 128 then
        cancelTween('camMoveToBF')
        cancelTween('camMoveToBFY')
        doTweenX('camMoveToDadSlow', 'camFollow', dadPos.x, 4, 'quadInOut')
        doTweenY('camMoveToDadYSlow', 'camFollow', dadPos.y, 4, 'quadInOut')
        doTweenZoom('camZoomToDad', 'camGame', 0.7, 4, 'quadInOut')
        
    elseif curStep == 156 then
        setProperty('isCameraOnForcedPos', false)
        doTweenZoom('camResetZoom', 'camGame', 0.7, 1, 'sineOut')
    end
end
function onTweenCompleted(tag)
    if tag == 'camZoomToGF' then
        setProperty('defaultCamZoom', 0.8)
    elseif tag == 'camZoomToDad' then
        setProperty('defaultCamZoom', 0.7)
    end
end