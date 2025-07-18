ab = {'1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','~','!','@','#','%','&','*','?'}
score = ''
misses = ''
rating = ''
step = 30
--多少step换一次font
fn = {'CAT.ttf','goodbyeDespair.ttf','Sponge.ttf','ZillaSlabBold.ttf','MFM.ttf','COMIC.ttf','Nice.ttf','vcr.ttf','test.ttf'}--font名字


function onUpdate()

for i = 1,5 do
score = score..ab[getRandomInt(1, #(ab))]
misses = misses..ab[getRandomInt(1, #(ab))]
rating = rating..ab[getRandomInt(1, #(ab))]
end
--setProperty('scoreTxt.text', 'score: ' .. score .. ' | misses: ' .. misses .. ' | rating: ' .. ratingName)
setProperty('scoreTxt.text','score: ' .. score .. ' | misses: ' .. misses .. ' | rating: ' .. rating)
score = ''
misses = ''
rating = ''
end

function onStepHit()
if curStep %step == 0 then
setTextFont('scoreTxt',fn[getRandomInt(1, #(fn))])
end
end
--made by white