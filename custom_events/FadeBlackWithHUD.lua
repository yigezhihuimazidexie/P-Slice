function onEvent(eventName, value1, value2)
    if eventName == 'FadeBlackWithHUD' then
        runHaxeCode([[
            PlayState.instance.camHUD.fade(0xFF000000, Conductor.stepCrochet / 1000 * ]] .. value1 .. [[, false)
        ]])
    end
end