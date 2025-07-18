local allowCountdown = false;
DebugMode=true
function onStartCountdown()
    if not allowCountdown and not seenCutscene then
        startVideo('过场动画');
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end