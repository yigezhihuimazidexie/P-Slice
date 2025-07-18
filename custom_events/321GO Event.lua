function onEvent(name, value1, value2)
    if name == "321GO Event" then
        -- 0.4 秒后显示 "ready"
        runTimer('showReady', 0.40)
    end
end

function onTimerCompleted(tag)
    if tag == 'showReady' then
        -- 显示 "ready"
        makeLuaSprite('ready', 'ready', 250, 160)
        addLuaSprite('ready', true)
        setObjectCamera('ready', 'other')
        doTweenAlpha('readyBye', 'ready', 0, 0.40, 'linear')
    elseif tag == 'readyBye' then
        -- 显示 "set"
        makeLuaSprite('set', 'set', 250, 160)
        addLuaSprite('set', true)
        setObjectCamera('set', 'other')
        doTweenAlpha('setBye', 'set', 0, 0.40, 'linear')
    elseif tag == 'setBye' then
        -- 显示 "go"
        makeLuaSprite('go', 'go', 330, 100)
        addLuaSprite('go', true)
        setObjectCamera('go', 'other')
        doTweenAlpha('goBye', 'go', 0, 0.40, 'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'readyBye' then
        -- "ready" 消失后触发 "set" 的显示
        runTimer('readyBye', 0)
    elseif tag == 'setBye' then
        -- "set" 消失后触发 "go" 的显示
        runTimer('setBye', 0)
    end
end