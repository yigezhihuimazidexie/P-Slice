function onCreate()
	
	makeLuaSprite('BG1', 'stages/DDTOPlusBG/clubroom/DDLCfarbg', -187, -245);
	setScrollFactor('BG1', 0.9, 0.9);
        setProperty("BG1.scale.x", 1.6);
        setProperty("BG1.scale.y", 1.6);


	makeLuaSprite('BG2', 'stages/DDTOPlusBG/clubroom/DDLCbg', -187, -245);
        setProperty("BG2.scale.x", 1.6);
        setProperty("BG2.scale.y", 1.6);


	makeLuaSprite('BG3', 'stages/DDTOPlusBG/clubroom/clublights', -187, -245);
        setProperty("BG3.scale.x", 1.6);
        setProperty("BG3.scale.y", 1.6);

	makeLuaSprite('BG4', 'stages/DDTOPlusBG/clubroom/DesksFront', -185, -235);
	setScrollFactor('BG4', 1.3, 1.3);
        setProperty("BG4.scale.x", 1.6);
        setProperty("BG4.scale.y", 1.6);

	makeLuaSprite('8', 'FinalEscape/SkyBG', -457, -100);
	setLuaSpriteScrollFactor('8', 1, 1);
	scaleObject('8', 2, 2);

	makeLuaSprite('5', 'FinalEscape/DestroyedClub', -457, -350);
	setLuaSpriteScrollFactor('5', 1, 1);
	scaleObject('5', 1.5, 1.5);	
	setProperty('5.visible', false);
	setObjectOrder('5', 3);

	makeLuaSprite('7', 'CW', -457, -100);
	setLuaSpriteScrollFactor('6', 1, 1);
	scaleObject('7', 5, 5);	

    makeLuaSprite('down','vignette', 0, 0);
    scaleObject('down', 1, 1);
    setObjectCamera('down', 'hud')

	makeLuaSprite('1','FinalEscape/computerShadow', 0, 0);
    scaleObject('1', 0.7, 0.7);
    setObjectCamera('1', 'hud')

	addLuaSprite('BG1', false);
	addLuaSprite('BG2', false);
	addLuaSprite('BG3', false);
	addLuaSprite('BG4', false);
	addLuaSprite('8', false);
	addLuaSprite('5', false);
	addLuaSprite('7', false);
	addLuaSprite('down',true)
	addLuaSprite('1',true)
end

