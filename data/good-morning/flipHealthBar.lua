local flipHealthBar = false --true为开启反转，false为关闭反转
local healthScaleX = 1.4 --健康条的长度倍数
local healthScaleY = 1.2 --健康条的宽度倍数

function onCreatePost()
    setProperty('healthBar.scale.x', healthScaleX)
    setProperty('healthBar.scale.y', healthScaleY)
    setProperty('healthBarBG.scale.x', healthScaleX)
    setProperty('healthBarBG.scale.y', healthScaleY)
end

function onUpdatePost()
    if flipHealthBar == true then
    setProperty('iconP1.x', (getProperty('healthBar.x') + ((593 * getProperty('healthBar.scale.x')) * (getProperty('healthBar.percent') / 100)) - 125) - ((593 * (getProperty('iconP1.scale.x') - 1)) / 8) - ((593 * getProperty('healthBar.scale.x') - 593) / 2))
    setProperty('iconP2.x', (getProperty('healthBar.x') + ((593 * getProperty('healthBar.scale.x')) * (getProperty('healthBar.percent') / 100)) - 20) + ((593 * (getProperty('iconP2.scale.x') - 1)) / 8) - ((593 * getProperty('healthBar.scale.x') - 593) / 2))

    setProperty('healthBar.flipX', true)
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
    else
    setProperty('iconP1.x', (getProperty('healthBar.x') + (593 * getProperty('healthBar.scale.x')) - ((593 * getProperty('healthBar.scale.x')) * (getProperty('healthBar.percent') / 100)) - 20) + ((593 * (getProperty('iconP1.scale.x') - 1)) / 8) - ((593 * getProperty('healthBar.scale.x') - 593) / 2))
    setProperty('iconP2.x', (getProperty('healthBar.x') + (593 * getProperty('healthBar.scale.x')) - ((593 * getProperty('healthBar.scale.x')) * (getProperty('healthBar.percent') / 100)) - 125) - ((593 * (getProperty('iconP2.scale.x') - 1)) / 8) - ((593 * getProperty('healthBar.scale.x') - 593) / 2))

    setProperty('healthBar.flipX', false)
    setProperty('iconP1.flipX', false)
    setProperty('iconP2.flipX', false)
    end
end