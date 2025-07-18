function onCreate()
    makeLuaSprite('backDark', 'erect/backDark', 1107, -900);
	setLuaSpriteScrollFactor('backDark', 1, 1);
	scaleObject('backDark', 5, 5);
    addLuaSprite('backDark', false);

    makeAnimatedLuaSprite('crowd', 'erect/crowd', 100, 100)
    addAnimationByPrefix('crowd', 'crowd', 'Symbol 2 instance', 15, true)
    addLuaSprite('crowd', false)
    scaleObject('crowd', 2, 2);

    makeLuaSprite('stage_bg', 'erect/stage_bg', -957, -500);
	setLuaSpriteScrollFactor('stage_bg', 1, 1);
	scaleObject('stage_bg', 1.5, 1.5);
    addLuaSprite('stage_bg', false);

    makeLuaSprite('server', 'erect/server', -457, 50);
	setLuaSpriteScrollFactor('server', 1, 1);
	scaleObject('server', 1.5, 1.5);
    addLuaSprite('server', false);

    makeLuaSprite('orangeLight', 'erect/orangeLight', -457, 50);
	setLuaSpriteScrollFactor('servorangeLighter', 1, 1);
	scaleObject('orangeLight', 1.5, 1.5);
    addLuaSprite('orangeLight', true);
end