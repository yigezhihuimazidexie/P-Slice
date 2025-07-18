function onCreate()
    -- 创建图片
    makeAnimatedLuaSprite('6H2', '6H2', -500, 200);
	addAnimationByPrefix('6H2', '', 'speak', 24, true)
	scaleObject('6H2', 0.8, 0.8)  -- 图片初始位置在屏幕左侧外
    setObjectCamera('6H2', 'hud')  -- 将图片放置在HUD层
    addLuaSprite('6H2', true)  -- 添加图片到游戏
    setProperty('6H2.alpha', 0)  -- 初始透明度为0（完全透明）
end

function onStepHit()
    -- 在特定时间点触发图片的显示和消失
    if curStep == 1077 then
        doTweenX('6H2In', '6H2', 200, 1, 'sineOut')  -- 图片从左侧平滑移动到x=100的位置
        doTweenAlpha('6H2FadeIn', '6H2', 1, 0.5, 'linear')  -- 图片渐显
    elseif curStep == 1110 then
        doTweenX('6H2Out', '6H2', -500, 1, 'sineIn')  -- 图片平滑移出屏幕左侧
        doTweenAlpha('6H2FadeOut', '6H2', 0, 0.5, 'linear')  -- 图片渐隐
    end
end