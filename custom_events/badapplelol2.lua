local condition = 0

function onEvent(name, value1, value2)
    if name == 'badapplelol2' then
        if value2 == 'bf' then
            doTweenAlpha('boy', 'boyfriend', 1, 0.5)
            doTweenAlpha('daddy', 'dad', 0, 0.5)
        end
        if value2 == 'dad' then
            doTweenAlpha('boy', 'boyfriend', 0, 0.5)
            doTweenAlpha('daddy', 'dad', 1, 0.5)
        end
        if value2 == 'both' then
            doTweenAlpha('boy', 'boyfriend', 1, 0.5)
            doTweenAlpha('daddy', 'dad', 1, 0.5)
        end

        if value1 == 'a1' then
            -- 创建白色背景并缓入
            makeLuaSprite('whitebg', nil, -900, -600)
            makeGraphic('whitebg', 100, 100, 'ffffff')
            scaleObject('whitebg', 999, 999)
            addLuaSprite('whitebg', false) -- 将背景放在人物下方
            setProperty('whitebg.alpha', 0) -- 初始透明度为0
            doTweenAlpha('whitebgFadeIn', 'whitebg', 0.7, 0.5, 'linear') -- 缓入白色背景，透明度为0.7
            condition = 2
        elseif value1 == 'a2' then
            -- 创建黑色背景并缓入
            makeLuaSprite('blackbg', nil, -900, -600)
            makeGraphic('blackbg', 100, 100, '000000')
            scaleObject('blackbg', 999, 999)
            addLuaSprite('blackbg', false) -- 将背景放在人物下方
            setProperty('blackbg.alpha', 0) -- 初始透明度为0
            doTweenAlpha('blackbgFadeIn', 'blackbg', 0.7, 0.5, 'linear') -- 缓入黑色背景，透明度为0.7
            condition = 1
        elseif value1 == 'b' then
            -- 缓出背景
            if condition == 2 then
                doTweenAlpha('whitebgFadeOut', 'whitebg', 0, 0.5, 'linear', function()
                    removeLuaSprite('whitebg') -- 缓出完成后移除白色背景
                end)
            elseif condition == 1 then
                doTweenAlpha('blackbgFadeOut', 'blackbg', 0, 0.5, 'linear', function()
                    removeLuaSprite('blackbg') -- 缓出完成后移除黑色背景
                end)
            end
            condition = 0
        end
    end
end