nightbg ='new/night/'
function onCreatePost()
setProperty("sky.visible",true)
setProperty("bg.visible",true)
setProperty("light.visible",true)
setProperty("qiuzhang.visible",true)
setProperty("floor.visible",true)
setProperty("cloud.visible",true)

setProperty("nsky.visible",false)
setProperty("nbg.visible",false)
setProperty("nlight.visible",false)
setProperty("nfloor.visible",false)
setProperty("ncloud.visible",false)


end
function onCreate()
makeLuaSprite('nsky', nightbg..'sky', -500, -600);
scaleObject('nsky', 1.4, 1.4);
addLuaSprite('nsky',false)

makeLuaSprite('ncloud', nightbg..'cloud', -500, -600);
scaleObject('ncloud', 1.4, 1.4);
addLuaSprite('ncloud',false)

makeLuaSprite('nbg', nightbg..'bg', -500, -600);
scaleObject('nbg', 1.4, 1.4);
addLuaSprite('nbg',false)

makeLuaSprite('nfloor', nightbg..'floor', -500, -600);
scaleObject('nfloor', 1.4, 1.4);
addLuaSprite('nfloor',false)

makeLuaSprite('nlight', nightbg..'light', -1300, -720);
scaleObject('nlight', 1, 1);
addLuaSprite('nlight',false)
end
function onStepHit()
if curStep == 511 then
setProperty("nsky.visible",true)
setProperty("nbg.visible",true)
setProperty("nlight.visible",true)
setProperty("nfloor.visible",true)
setProperty("ncloud.visible",true)

setProperty("sky.visible",false)
setProperty("bg.visible",false)
setProperty("light.visible",false)
setProperty("qiuzhang.visible",false)
setProperty("floor.visible",false)
setProperty("cloud.visible",false)
end
 end