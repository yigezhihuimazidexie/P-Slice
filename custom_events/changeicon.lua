Dadicon = 'icon-gf' --dd方小图标
bficon = 'icon-pico' --bf方小图标
dadoffset = 100 --偏移
bfoffset = 10
function onCreate()
            makeLuaSprite('iconP3', 'icons/'..bficon, 0, 0)
            addLuaSprite('iconP3',true)
            setObjectCamera('iconP3', 'hud') 
            setProperty('iconP3.flipX',true)
            setProperty('iconP3.visible',false)          
            setObjectOrder('iconP3', getObjectOrder('iconP1') + 999)     
            
            makeLuaSprite('iconP4', 'icons/'..Dadicon, 0, 0)
            addLuaSprite('iconP4',true)
            setObjectCamera('iconP4', 'hud')
            setProperty('iconP4.visible',false)              
            setObjectOrder('iconP4', getObjectOrder('iconP2') + 999)     

            setProperty('iconP3._frame.frame.x', 0)
            setProperty('iconP3._frame.frame.width', 150) 
            setProperty('iconP4._frame.frame.x', 0)
            setProperty('iconP4._frame.frame.width', 150  )                                  
end

function onUpdatePost(elapsed)
local health = getProperty('health')
			if health >= 1.625 then			
            setProperty('iconP4._frame.frame.x', 150)
            setProperty('iconP4._frame.frame.width', 150)
            elseif health <= 1.625 and health >= 0.375 then
            setProperty('iconP3._frame.frame.x', 0)
            setProperty('iconP3._frame.frame.width', 150) 
            setProperty('iconP4._frame.frame.x', 0)
            setProperty('iconP4._frame.frame.width', 150)                               
            elseif health <= 0.375 then 
            setProperty('iconP3._frame.frame.x', 150)
            setProperty('iconP3._frame.frame.width', 150)             
            end     
    for i = 1,2 do                                        
setProperty('iconP3.x',getProperty('iconP2.x')); setProperty('iconP3.y',getProperty('iconP2.y')); setProperty('iconP3.scale.x',getProperty('iconP2.scale.x')); setProperty('iconP3.scale.y',getProperty('iconP2.scale.y')); setProperty('iconP3.angle',getProperty('iconP2.angle')); setProperty('iconP3.alpha',getProperty('iconP2.alpha')); setProperty('iconP3.offset.x',getProperty('iconP2.offset.x') + bfoffset);
setProperty('iconP4.x',getProperty('iconP1.x')); setProperty('iconP4.y',getProperty('iconP1.y')); setProperty('iconP4.scale.x',getProperty('iconP1.scale.x')); setProperty('iconP4.scale.y',getProperty('iconP1.scale.y')); setProperty('iconP4.angle',getProperty('iconP1.angle')); setProperty('iconP4.alpha',getProperty('iconP1.alpha')); setProperty('iconP4.offset.x',getProperty('iconP1.offset.x') + dadoffset);
--setProperty('iconP3.origin.x',20+(i-1)*60);setProperty('iconP3.origin.y',0);setProperty('iconP4.origin.x',20+(i-1)*60);setProperty('iconP4.origin.y',0)
end
end

function onEvent(name,value1,value2)
if name == 'changeicon' then
if value1 == 'dad true' then
setProperty('iconP4.visible',true)
setProperty('iconP2.visible',false)
end
if value1 == 'dad false' then
setProperty('iconP4.visible',false)
setProperty('iconP2.visible',true)
end
if value1 == 'bf true' then
setProperty('iconP3.visible',true)
setProperty('iconP1.visible',false)
end
if value1 == 'bf false' then
setProperty('iconP3.visible',false)
setProperty('iconP1.visible',true)
end
end
end





