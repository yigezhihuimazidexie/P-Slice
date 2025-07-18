-- Script by AquaStrikr (https://twitter.com/AquaStrikr_)
function onCreatePost()
	makeLuaSprite('Health', 'healthbar-amt')
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	setObjectOrder('Health', getObjectOrder('healthBar') + 40)  
	setObjectOrder('iconP1', getObjectOrder('Health') + 2)  
    setObjectOrder('iconP2', getObjectOrder('Health') + 2)
	scaleObject('Health',0.92,0.88)
	setProperty('healthBar.visible', true)
end

function onUpdatePost(elapsed)
	setProperty('Health.x', getProperty('healthBar.x') - 22)
	setProperty('Health.y', getProperty('healthBar.y') - 25)
end