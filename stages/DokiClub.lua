function onCreate()
	makeLuaSprite('BG7', 'bigmonika/lights', -285, -135);
	setScrollFactor('BG7', 1, 1);
		setProperty("BG7.scale.x", 1.6);
		setProperty("BG7.scale.y", 1.6);

	makeLuaSprite('BG6', 'bigmonika/WindowLight', -285, -135);
	setScrollFactor('BG6', 1, 1);
		setProperty("BG6.scale.x", 1.6);
		setProperty("BG6.scale.y", 1.6);

	makeLuaSprite('BG8', 'bigmonika/Clouds', -285, -135);
	setScrollFactor('BG8', 1, 1);
		setProperty("BG8.scale.x", 1.6);
		setProperty("BG8.scale.y", 1.6);

	makeLuaSprite('BG9', 'bigmonika/Sky', -285, -135);
	setScrollFactor('BG9', 1, 1);
		setProperty("BG9.scale.x", 1.6);
		setProperty("BG9.scale.y", 1.6);

	makeLuaSprite('BG5', 'bigmonika/BG', -285, -135);
	setScrollFactor('BG5', 1, 1);
		setProperty("BG5.scale.x", 1.6);
		setProperty("BG5.scale.y", 1.6);

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

	addLuaSprite('BG1', false);
	addLuaSprite('BG2', false);
	addLuaSprite('BG3', false);
	addLuaSprite('BG4', false);
	addLuaSprite('BG9', false);
	addLuaSprite('BG8', false);
	addLuaSprite('BG5', false);
	addLuaSprite('BG6', false);
	addLuaSprite('BG7', false);	
end
