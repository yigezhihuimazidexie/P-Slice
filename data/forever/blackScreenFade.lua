local fadeStarted = false

function onCreate()
    -- 创建一个黑色的图片
    makeLuaSprite('blackScreen', '', 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'hud')
    addLuaSprite('blackScreen', true)

    -- 设置初始透明度为 1（完全显示）
    setProperty('blackScreen.alpha', 1)
end

function onSongStart()
    -- 在歌曲开始时，使用 doTweenAlpha 让黑色图片逐渐消失
    doTweenAlpha('blackScreenFadeOut', 'blackScreen', 0, 5, 'linear')
end

function onTweenCompleted(tag)
    -- 当 tween 完成后，移除黑色图片
    if tag == 'blackScreenFadeOut' then
        removeLuaSprite('blackScreen', true)
    end
end

function onUpdate(elapsed)
    -- 获取歌曲剩余时间
    local songLength = getProperty('songLength')
    local songPosition = getProperty('songTime')
    local timeRemaining = songLength - songPosition

    -- 如果剩余时间小于 5 秒且未开始淡入，则触发淡入效果
    if timeRemaining <= 5 and not fadeStarted then
        fadeStarted = true
        -- 重新创建黑色图片（如果之前被移除）
        makeLuaSprite('blackScreen', '', 0, 0)
        makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
        setObjectCamera('blackScreen', 'hud')
        setProperty('blackScreen.alpha', 0) -- 初始透明度为 0
        addLuaSprite('blackScreen', true)

        -- 使用 doTweenAlpha 让黑色图片逐渐显示
        doTweenAlpha('blackScreenFadeIn', 'blackScreen', 1, 5, 'linear')
    end
end
