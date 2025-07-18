function onCreatePost()
if downscroll then
doTweenX('Bar','healthBar',120,0.0001,'linear')
doTweenX('time','timeBar',760,0.0001,'linear')
setProperty('timeTxt.visible',false)
doTweenX('txt','scoreTxt',-390,0.0001,'linear')
else
doTweenX('Bar','healthBar',120,0.0001,'linear')
doTweenX('time','timeBar',760,0.0001,'linear')
doTweenX('txt','scoreTxt',-210,0.0001,'linear')
setProperty('timeTxt.visible',false)
end
end