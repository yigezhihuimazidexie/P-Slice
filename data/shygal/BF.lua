function onCreate()
    -- 创建图片
    makeAnimatedLuaSprite('BF_Dialogue', 'BF_Dialogue', -500, 400);
	addAnimationByPrefix('BF_Dialogue', '', 'BF EXCITED LOOP', 24, true)
	scaleObject('BF_Dialogue', 0.8, 0.8)  -- 图片初始位置在屏幕左侧外
    setObjectCamera('BF_Dialogue', 'hud')  -- 将图片放置在HUD层
    addLuaSprite('BF_Dialogue', true)  -- 添加图片到游戏
    setProperty('BF_Dialogue.alpha', 0)  -- 初始透明度为0（完全透明）
end

function onStepHit()
    -- 在特定时间点触发图片的显示和消失
    if curStep == 1695 then
        doTweenX('BF_DialogueIn', 'BF_Dialogue', 200, 1, 'sineOut')  -- 图片从左侧平滑移动到x=100的位置
        doTweenAlpha('BF_DialogueFadeIn', 'BF_Dialogue', 1, 0.5, 'linear')  -- 图片渐显
    elseif curStep == 1710 then
        doTweenX('BF_DialogueOut', 'BF_Dialogue', -500, 1, 'sineIn')  -- 图片平滑移出屏幕左侧
        doTweenAlpha('BF_DialogueFadeOut', 'BF_Dialogue', 0, 0.5, 'linear')  -- 图片渐隐
    end
end
