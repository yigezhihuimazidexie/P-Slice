function onCreatePost()
setProperty('dad.alpha',0)
setProperty('boyfriend.alpha',0)
setProperty('gf.alpha',0)
setProperty('healthBar.alpha',0)
setProperty('healthBarBG.alpha',0)
setProperty('iconP1.alpha',0)
setProperty('iconP2.alpha',0)
setProperty('scoreTxt.alpha',0)

end

function onStepHit()
if curStep == 1 then

setProperty('dad.alpha',0.45)
doTweenAlpha('icop2', 'iconP2', 0.45, 0.45, 'linear')
end
if curStep == 127 then
doTweenAlpha('dad', 'dad', 0, 0.45, 'linear')
doTweenAlpha('icop2', 'iconP2', 0, 0.45, 'linear')
doTweenAlpha('boyfriend', 'boyfriend', 0.45, 0.45, 'linear')
doTweenAlpha('icop1', 'iconP1', 0.45, 0.45, 'linear')

end
if curStep == 255 then
doTweenAlpha('b', 'black', 0, 2, 'linear')
doTweenAlpha('ddd', 'dad', 1, 2, 'linear')
doTweenAlpha('boyfriend', 'boyfriend', 1, 2, 'linear')
doTweenAlpha('gf', 'gf', 1, 2, 'linear')
doTweenAlpha('s', 'healthBarBG', 1, 2, 'linear')
doTweenAlpha('bnd', 'scoreTxt', 1, 2, 'linear')
doTweenAlpha('byd', 'healthBar', 1, 2, 'linear')
doTweenAlpha('icop2', 'iconP2', 1, 2, 'linear')
doTweenAlpha('icop1', 'iconP1', 1, 2, 'linear')
end
if curStep == 511 then
setProperty('dad.alpha',0)
setProperty('gf.alpha',0)
setProperty('healthBar.alpha',0)
setProperty('healthBarBG.alpha',0)
setProperty('iconP2.alpha',0)
setProperty('scoreTxt.alpha',0)
cameraFlash('game', '0xFFFFFF', 0.65, true)
doTweenAlpha('b', 'black', 1, 0.65, 'linear')
end 
if curStep == 639 then
doTweenAlpha('dad', 'dad', 0.65, 0.45, 'linear')
doTweenAlpha('boyfriend', 'boyfriend', 0, 0.45, 'linear')
doTweenAlpha('icop2', 'iconP2', 1, 0.45, 'linear')
 end
 if curStep == 862 then
doTweenAlpha('ddd', 'dad', 1, 1, 'linear')
doTweenAlpha('boyfriend', 'boyfriend', 1, 1, 'linear')
doTweenAlpha('gf', 'gf', 1, 1, 'linear')
doTweenAlpha('b', 'black', 0, 1, 'linear')
setProperty('healthBar.alpha',1)
setProperty('healthBarBG.alpha',1)
setProperty('scoreTxt.alpha',1)
 end
if curStep == 1535 then
 setProperty('healthBar.alpha',0)
setProperty('healthBarBG.alpha',0)
setProperty('iconP1.alpha',0)
setProperty('iconP2.alpha',0)
setProperty('scoreTxt.alpha',0)
setProperty('gf.alpha',0)
setProperty('dad.color', 'FFFFFF')
setProperty('boyfriend.color', 'FFFFFF')
doTweenAlpha('b', 'black', 1, 0.65, 'linear')
 end
  end