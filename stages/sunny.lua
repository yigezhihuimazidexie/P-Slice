bg='new/afternoon/'
function onCreate()
    makeLuaSprite('down','new/down', 0, 0);
    scaleObject('down', 1, 1);
    addLuaSprite('down',true)
    setObjectCamera('down', 'hud')
function onCreatePost()
    makeLuaSprite('Health', 'bar')
    setObjectCamera('Health', 'hud')
    addLuaSprite('Health', true)
    setObjectOrder('Health',getObjectOrder('healthBar') + 90)
    setObjectOrder('iconP1', getObjectOrder('Health') + 10)  
    setObjectOrder('iconP2', getObjectOrder('Health') + 10)
    scaleObject('Health',0.98,0.98)
    setProperty('healthBar.visible', true)
end
    
function onUpdatePost(elapsed)
    setProperty('Health.x', getProperty('healthBar.x') - 225)
     setProperty('Health.y', getProperty('healthBar.y') - 35)
end     
makeLuaSprite('sky', bg..'sky', -500, -600);
scaleObject('sky', 1.4, 1.4);
addLuaSprite('sky',false)

makeLuaSprite('cloud', bg..'cloud', -500, -600);
scaleObject('cloud', 1.4, 1.4);
addLuaSprite('cloud',false)

makeLuaSprite('bg', bg..'bg', -500, -600);
scaleObject('bg', 1.4, 1.4);
addLuaSprite('bg',false)

makeLuaSprite('floor', bg..'floor', -500, -600);
scaleObject('floor', 1.4, 1.4);
addLuaSprite('floor',false)

makeLuaSprite('light', bg..'light', -1300, -720);
scaleObject('light', 1, 1);
addLuaSprite('light',false)

makeLuaSprite('MINI', 'MINI', -270, -150);
setLuaSpriteScrollFactor('MINI', 1.1, 1.1);
scaleObject('MINI', 1, 1);
addLuaSprite('MINI',true)
setProperty('MINI.visible', false)

makeAnimatedLuaSprite('qiuzhang', 'new/qiuzhang', -100, 100)
addAnimationByPrefix('qiuzhang', 'yepbuturright', 'idle', 12, true)
addLuaSprite('qiuzhang', false)
scaleObject('qiuzhang', 0.4, 0.4);
end