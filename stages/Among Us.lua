function onCreate()
    makeLuaSprite('4', 'Among Us/4', -5000, -100);
    setLuaSpriteScrollFactor('4', 1.2, 1);
    scaleObject('4', 5, 1.5);
    addLuaSprite('4', false);

    makeLuaSprite('3', 'Among Us/3', -1100, 100);
    setLuaSpriteScrollFactor('3', 1, 1);
    scaleObject('3', 1.5, 1.5);
    addLuaSprite('3', false);

    makeLuaSprite('s', 'Among Us/s', -500, 100);
    setLuaSpriteScrollFactor('s', 1, 1);
    scaleObject('s', 1.5, 1.5);
    addLuaSprite('s', false);

    makeLuaSprite('2', 'Among Us/2', -500, 100);
    setLuaSpriteScrollFactor('2', 1, 1);
    scaleObject('2', 1.5, 1.5);
    addLuaSprite('2', false);

    makeLuaSprite('1', 'Among Us/1', -500, 100);
    setLuaSpriteScrollFactor('1', 1, 1);
    scaleObject('1', 1.5, 1.5);
    addLuaSprite('1', true);

    makeLuaSprite('lightAbove', 'Among Us/lightAbove', -500, -900);
    setLuaSpriteScrollFactor('lightAbove', 1, 1);
    scaleObject('lightAbove', 5, 5);
    addLuaSprite('lightAbove', true);

    makeLuaSprite('lightred', 'Among Us/lightred', -1200, -900);
    setLuaSpriteScrollFactor('lightred', 1, 1);
    scaleObject('lightred', 15, 15);
    addLuaSprite('lightred', true);

    startTextureMovement()
end
function startTextureMovement()
    moveTexture('3', 2000, 15)
    runTimer('startMove4', 0.5)
end
function moveTexture(tag, targetX, duration)
    doTweenX(tag..'MoveTween', tag, targetX, duration, 'linear')
    runTimer(tag..'ResetTimer', duration)
end
function onTimerCompleted(tag)
    if tag == 'startMove4' then
        moveTexture('4', -1000, 15)   
    elseif tag == '3ResetTimer' then
        setProperty('3.x', -1100)
        moveTexture('3', 2000, 15)   
    elseif tag == '4ResetTimer' then
        setProperty('4.x', -5000)
        moveTexture('4', -1000, 15)
    end
end
