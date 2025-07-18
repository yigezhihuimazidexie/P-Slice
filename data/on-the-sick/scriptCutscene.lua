local allowCountdown = false;

function onEndSong()
    if not allowCountdown and not seenCutscene then
        startVideo('片尾');
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end