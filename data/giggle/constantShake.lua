-- 定义震动的强度和持续时间
local shakeStrength = 0.005; -- 震动强度（数值越大，震动越强烈）
local shakeDuration = 0.1; -- 每次震动的持续时间（秒）

-- 定义触发震动的函数
function triggerShake()
    cameraShake('camHUD', shakeStrength, shakeDuration); -- 触发 HUD 震动
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    -- 当对手按下音符时触发震动
    triggerShake()
end