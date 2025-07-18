function onUpdate()
if curStep == 0 then
noteTweenAlpha(1, 4, 0,0.0001, 'linear')
noteTweenAlpha(2, 5, 0,0.0001, 'linear')
noteTweenAlpha(3, 6, 0,0.0001, 'linear')
noteTweenAlpha(4, 7, 0,0.0001, 'linear')
noteTweenAlpha(5, 0, 0,0.0001, 'linear')
noteTweenAlpha(6, 1, 0,0.0001, 'linear')
noteTweenAlpha(7, 2, 0,0.0001, 'linear')
noteTweenAlpha(8, 3, 0,0.0001, 'linear')
end
 end

function onStepHit()
if curStep == 1 then
noteTweenAlpha('dadnote5', 0, 0.65,0.45, 'linear')
noteTweenAlpha('dadnote6', 1, 0.65,0.45, 'linear')
noteTweenAlpha('dadnote7', 2, 0.65,0.45, 'linear')
noteTweenAlpha('dadnote8', 3, 0.65,0.45, 'linear')
end
if curStep == 127 then
noteTweenAlpha('dadnote5', 0, 0, 2, 'linear')
noteTweenAlpha('dadnote6', 1, 0, 2, 'linear')
noteTweenAlpha('dadnote7', 2, 0, 2, 'linear')
noteTweenAlpha('dadnote8', 3, 0, 2, 'linear')

noteTweenAlpha('bfnote1', 4, 1, 2, 'linear')
noteTweenAlpha('bfnote2', 5, 1, 2, 'linear')
noteTweenAlpha('bfnote3', 6, 1, 2, 'linear')
noteTweenAlpha('bfnote4', 7, 1, 2, 'linear')
end

if curStep == 235 then
noteTweenAlpha('dadnote5', 0, 1, 2, 'linear')
noteTweenAlpha('dadnote6', 1, 1, 2, 'linear')
noteTweenAlpha('dadnote7', 2, 1, 2, 'linear')
noteTweenAlpha('dadnote8', 3, 1, 2, 'linear')
noteTweenAlpha('bfnote1', 4, 1, 2, 'linear')
noteTweenAlpha('bfnote2', 5, 1, 2, 'linear')
noteTweenAlpha('bfnote3', 6, 1, 2, 'linear')
noteTweenAlpha('bfnote4', 7, 1, 2, 'linear')
end
if curStep == 1280 then
if downscroll then
for i=0,3 do
local varName='defaultOpponentStrumY'..i
noteTweenY(varName,i,_G[varName]-540,0.25)
setPropertyFromGroup('opponentStrums',i,'downScroll',not getPropertyFromGroup('opponentStrums',i,'downScroll'))
end
 end
if downscroll then
else
noteTweenY(varName,i,_G[varName]-35,0.25)
setPropertyFromGroup('opponentStrums',i,'downScroll',not getPropertyFromGroup('opponentStrums',i,'downScroll'))
end
setProperty('healthBar.alpha',0)
setProperty('healthBarBG.alpha',0)
setProperty('iconP1.alpha',0)
setProperty('iconP2.alpha',0)
setProperty('scoreTxt.alpha',0)
   end
    end