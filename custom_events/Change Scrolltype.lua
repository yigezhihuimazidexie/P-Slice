local defaultVert = 'Up'
local defaultHori = 'Side'
local Vertical = 'off'
local Horizontal = 'off'
local sectionCheck = 'watiting...'

function onUpdate()

	makeLuaText('defaultslabel', "   Default's " .. tostring(defaultVert) .. " and " .. tostring(defaultHori) .. "scroll", x, y, 340);
	setProperty('defaultslabel.pos.x', getProperty('Vert.pos.x'));
	setProperty('defaultslabel.pos.y', getProperty('Vert.pos.y'));
	setTextSize('defaultslabel', 24);
	setProperty('defaultslabel' ..'.borderColor', getColorFromHex('000000'));
	setProperty('defaultslabel' ..'.borderSize', 1.2);

	makeLuaText('titlingthisshit', '   Current Scrolltypes', x, y, 370);
	setProperty('titlingthisshit.pos.x', getProperty('Vert.pos.x'));
	setProperty('titlingthisshit.pos.y', getProperty('Vert.pos.y'));
	setTextSize('titlingthisshit', 34);
	setProperty('titlingthisshit' ..'.borderColor', getColorFromHex('000000'));
	setProperty('titlingthisshit' ..'.borderSize', 1.2);

	makeLuaText('Vert', ' Downscroll: ' .. tostring(Vertical), x, y, 400);
	setProperty('Vert.scale.x', getProperty('scoreTxt.scale.x'));
	setProperty('Vert.scale.y', getProperty('scoreTxt.scale.y'));
	setTextSize('Vert', 48);
	setProperty('Vert' ..'.borderColor', getColorFromHex('000000'));
	setProperty('Vert' ..'.borderSize', 1.2);

	makeLuaText('Hori', ' Middlescroll: ' .. tostring(Horizontal), x, y, 450);
	setProperty('Hori.pos.x', getProperty('Vert.pos.x'))
	setProperty('Hori.pos.y', getProperty('Vert.pos.y'))
	setProperty('Hori.scale.x', getProperty('scoreTxt.scale.x'))
	setProperty('Hori.scale.y', getProperty('scoreTxt.scale.y'))
	setTextSize('Hori', 48);
	setProperty('Hori' ..'.borderColor', getColorFromHex('000000'));
	setProperty('Hori' ..'.borderSize', 1.2);

	makeLuaText('sectionCheck', ' Section: ' .. tostring(sectionCheck), x, y, 500);
	setProperty('sectionCheck.pos.x', getProperty('Hori.pos.x'))
	setProperty('sectionCheck.pos.y', getProperty('Hori.pos.y'))
	setProperty('sectionCheck.scale.x', getProperty('scoreTxt.scale.x'))
	setProperty('sectionCheck.scale.y', getProperty('scoreTxt.scale.y'))
	setTextSize('sectionCheck', 48);
	setProperty('sectionCheck' ..'.borderColor', getColorFromHex('000000'));
	setProperty('sectionCheck' ..'.borderSize', 1.2);

	if mustHitSection == false then
		sectionCheck = 'opponent'
	elseif mustHitSection == true then
		sectionCheck = 'player'
	end
	if gfSection == true then
		sectionCheck = 'dancer'
	end
	

	if getPropertyFromClass('PlayState', 'chartingMode') then
		addLuaText('defaultslabel');
		addLuaText('titlingthisshit');
		addLuaText('Vert');
		addLuaText('Hori');
		addLuaText('sectionCheck');
	end
end

function onUpdatePost()

	if Vertical == 'off' then
		if downscroll then
			noteTweenDirection('scrollDir0', 0, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir1', 1, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir2', 2, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir3', 3, -90, 1, 'elasticOut')
			
			noteTweenDirection('scrollDir4', 4, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir5', 5, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir6', 6, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir7', 7, -90, 1, 'elasticOut')

			noteTweenY('moveNoteY0', 0, 150, 1, 'elasticOut')
			noteTweenY('moveNoteY1', 1, 150, 1, 'elasticOut')
			noteTweenY('moveNoteY2', 2, 150, 1, 'elasticOut')
			noteTweenY('moveNoteY3', 3, 150, 1, 'elasticOut')

			noteTweenY('moveNoteY4', 4, 150, 1, 'elasticOut')
			noteTweenY('moveNoteY5', 5, 150, 1, 'elasticOut')
			noteTweenY('moveNoteY6', 6, 150, 1, 'elasticOut')
			noteTweenY('moveNoteY7', 7, 150, 1, 'elasticOut')
		else
			noteTweenDirection('scrollDir0', 0, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir1', 1, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir2', 2, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir3', 3, 90, 1, 'elasticOut')

			noteTweenDirection('scrollDir4', 4, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir5', 5, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir6', 6, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir7', 7, 90, 1, 'elasticOut')
			
			noteTweenY('moveNoteY0', 0, 50, 1, 'elasticOut')
			noteTweenY('moveNoteY1', 1, 50, 1, 'elasticOut')
			noteTweenY('moveNoteY2', 2, 50, 1, 'elasticOut')
			noteTweenY('moveNoteY3', 3, 50, 1, 'elasticOut')

			noteTweenY('moveNoteY4', 4, 50, 1, 'elasticOut')
			noteTweenY('moveNoteY5', 5, 50, 1, 'elasticOut')
			noteTweenY('moveNoteY6', 6, 50, 1, 'elasticOut')
			noteTweenY('moveNoteY7', 7, 50, 1, 'elasticOut')
		end
	elseif Vertical == 'on' then
		if downscroll then
			noteTweenDirection('scrollDir0', 0, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir1', 1, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir2', 2, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir3', 3, 90, 1, 'elasticOut')

			noteTweenDirection('scrollDir4', 4, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir5', 5, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir6', 6, 90, 1, 'elasticOut')
			noteTweenDirection('scrollDir7', 7, 90, 1, 'elasticOut')

			noteTweenY('moveNoteY0', 0, 570, 1, 'elasticOut')
			noteTweenY('moveNoteY1', 1, 570, 1, 'elasticOut')
			noteTweenY('moveNoteY2', 2, 570, 1, 'elasticOut')
			noteTweenY('moveNoteY3', 3, 570, 1, 'elasticOut')

			noteTweenY('moveNoteY4', 4, 570, 1, 'elasticOut')
			noteTweenY('moveNoteY5', 5, 570, 1, 'elasticOut')
			noteTweenY('moveNoteY6', 6, 570, 1, 'elasticOut')
			noteTweenY('moveNoteY7', 7, 570, 1, 'elasticOut')
		else
			noteTweenDirection('scrollDir0', 0, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir1', 1, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir2', 2, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir3', 3, -90, 1, 'elasticOut')

			noteTweenDirection('scrollDir4', 4, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir5', 5, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir6', 6, -90, 1, 'elasticOut')
			noteTweenDirection('scrollDir7', 7, -90, 1, 'elasticOut')

			noteTweenY('moveNoteY0', 0, 500, 1, 'elasticOut')
			noteTweenY('moveNoteY1', 1, 500, 1, 'elasticOut')
			noteTweenY('moveNoteY2', 2, 500, 1, 'elasticOut')
			noteTweenY('moveNoteY3', 3, 500, 1, 'elasticOut')

			noteTweenY('moveNoteY4', 4, 500, 1, 'elasticOut')
			noteTweenY('moveNoteY5', 5, 500, 1, 'elasticOut')
			noteTweenY('moveNoteY6', 6, 500, 1, 'elasticOut')
			noteTweenY('moveNoteY7', 7, 500, 1, 'elasticOut')
		end
	end


	if Horizontal == 'off' then
		noteTweenX('moveNoteX0', 0, 92, 1, 'elasticOut');
		noteTweenX('moveNoteX1', 1, 204, 1, 'elasticOut');
		noteTweenX('moveNoteX2', 2, 316, 1, 'elasticOut');
		noteTweenX('moveNoteX3', 3, 428, 1, 'elasticOut');
    
		noteTweenX('moveNoteX4', 4, 732, 1, 'elasticOut');
		noteTweenX('moveNoteX5', 5, 844, 1, 'elasticOut');
		noteTweenX('moveNoteX6', 6, 956, 1, 'elasticOut');
		noteTweenX('moveNoteX7', 7, 1068, 1, 'elasticOut');
    
		noteTweenAlpha('alphaNote0', 0, 1, 1, 'linear')
		noteTweenAlpha('alphaNote1', 1, 1, 1, 'linear')
		noteTweenAlpha('alphaNote2', 2, 1, 1, 'linear')
		noteTweenAlpha('alphaNote3', 3, 1, 1, 'linear')
	elseif Horizontal == 'on' then
		noteTweenX('moveNoteX0', 0, 92, 1, 'elasticOut');
		noteTweenX('moveNoteX1', 1, 204, 1, 'elasticOut');
		noteTweenX('moveNoteX2', 2, 956, 1, 'elasticOut');
		noteTweenX('moveNoteX3', 3, 1068, 1, 'elasticOut');

		noteTweenX('moveNoteX4', 4, 416, 1, 'elasticOut');
		noteTweenX('moveNoteX5', 5, 528, 1, 'elasticOut');
		noteTweenX('moveNoteX6', 6, 640, 1, 'elasticOut');
		noteTweenX('moveNoteX7', 7, 752, 1, 'elasticOut');
		
		noteTweenAlpha('alphaNote0', 0, 0.5, 1, 'linear')
		noteTweenAlpha('alphaNote1', 1, 0.5, 1, 'linear')
		noteTweenAlpha('alphaNote2', 2, 0.5, 1, 'linear')
		noteTweenAlpha('alphaNote3', 3, 0.5, 1, 'linear')
	end
end

function onCreate()
	if not downscroll then
		Vertical = 'off'
		defaultVert = 'Up'
	else
		Vertical = 'on'
		defaultVert = 'Down'
	end
	if not middlescroll then
		Horizontal = 'off'
		defaultHori = 'Side'
	else
		Horizontal = 'on'
		defaultHori = 'Middle'
	end
end

function onCreatePost()
	doTweenAlpha('title0', 'titlingthisshit', 0, 0.001, 'elasticInOut')
	doTweenAlpha('vert0', 'Vert', 0, 0.001, 'elasticInOut')
	doTweenAlpha('hori0', 'Hori', 0, 0.001, 'elasticInOut')
	doTweenAlpha('secCheck0', 'sectionCheck', 0, 0.001, 'elasticInOut')
end

function onEvent(name, value1, value2)
	if name == 'Change Scrolltype' then

		if value1 == 'off' then
			Vertical = 'off'
		elseif value1 == 'on' then
			Vertical = 'on'
		elseif value1 == 'swap' then
			if Vertical == 'on' then
				Vertical = 'off'
			elseif Vertical == 'off' then
				Vertical = 'on'
			end
		elseif value1 == 'default' then
			if not downscroll then
				Vertical = 'off'
			else
				Vertical = 'on'
			end
		end

		if value2 == 'off' then
			Horizontal = 'off'
		elseif value2 == 'on' then
			Horizontal = 'on'
		elseif value2 == 'swap' then
			if Horizontal == 'on' then
				Horizontal = 'off'
			elseif Horizontal == 'off' then
				Horizontal = 'on'
			end
		elseif value2 == 'default' then
			if not middlescroll then
				Horizontal = 'off'
			else
				Horizontal = 'on'
			end
		end

		if value2 == 'unfunny' then
			addLuaScript('scripts/scrolltypes/funnyStuffMan')
			doTweenAlpha('secCheckShow', 'sectionCheck', 1, 50, 'elasticInOut')
		elseif value2 == 'funny' then
			removeLuaScript('scripts/scrolltypes/funnyStuffMan')
			doTweenAlpha('secCheckHide', 'sectionCheck', 1, 50, 'elasticInOut')
		end
	end
end

function onCountdownTick(counter)

	if counter == 3 then
		doTweenAlpha('title1', 'titlingthisshit', 1, 1, 'elasticInOut')
		doTweenAlpha('vert1', 'Vert', 1, 1, 'elasticInOut')
		doTweenAlpha('hori1', 'Hori', 1, 1, 'elasticInOut')
	end
end