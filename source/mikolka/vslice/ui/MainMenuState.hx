package mikolka.vslice.ui;

import mikolka.compatibility.ui.MainMenuHooks;
import mikolka.compatibility.VsliceOptions;
#if !LEGACY_PSYCH
import states.TitleState;
#if MODS_ALLOWED
import states.ModsMenuState;
#end
import states.AchievementsMenuState;
import states.CreditsState;
import states.editors.MasterEditorMenu;
#else
import editors.MasterEditorMenu;
#end
import mikolka.compatibility.ModsHelper;
import mikolka.vslice.freeplay.FreeplayState;
import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import options.OptionsState;
import mikolka.vslice.StickerSubState;

class MainMenuState extends MusicBeatState
{
	#if !LEGACY_PSYCH
	public static var psychEngineVersion:String = '1.0.4'; // This is also used for Discord RPC
	#else
	public static var psychEngineVersion:String = '0.6.3'; // This is also used for Discord RPC
	#end
	public static var pSliceVersion:String = '3.0.3'; 
	public static var funkinVersion:String = '0.6.0'; // Version of funkin' we are emulationg
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	var logoBl:FlxSprite;
	var logoTween:FlxTween;

	var optionShit:Array<String> = [
		'freeplay',
		'credits',
		'options',
		'week1',
		'week2',
		'week3'
	];

	var optionShitX:Array<Int> = [
		45,
		430,
		830,
		30,
		430,
		830
	];

	var optionShitY:Array<Int> = [
		360,
		350,
		340,
		150,
		150,
		150
	]; 

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var stickerSubState:StickerSubState;
	public function new(isDisplayingRank:Bool = false,?stickers:StickerSubState = null) {

		//TODO
		super();
		if (stickers != null)
			{
				stickerSubState = stickers;
			}
	}


	override function create()
	{
	
		Paths.clearUnusedMemory();
		if (stickerSubState != null)
		{
			  //this.persistentUpdate = true;
			  //this.persistentDraw = true;
		
			  openSubState(stickerSubState);
			  ModsHelper.clearStoredWithoutStickers();
			  stickerSubState.degenStickers();
			  FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}
		ModsHelper.clearStoredWithoutStickers();
		
		ModsHelper.resetActiveMods();

		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end


		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.antialiasing = VsliceOptions.ANTIALIASING;
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.antialiasing = VsliceOptions.ANTIALIASING;
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.color = 0xFFfd719b;
		add(magenta);

		logoBl = new FlxSprite(0, 0);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = ClientPrefs.data.antialiasing;
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24, false);
		logoBl.animation.play('bump');
		logoBl.offset.x = 0;
		logoBl.offset.y = 0;
		logoBl.scale.x = (640 / logoBl.frameWidth)/1.5;
		logoBl.scale.y = logoBl.scale.x;
		logoBl.updateHitbox();
		add(logoBl);
		logoBl.scrollFactor.set(0, 0);
		logoBl.x = 650 - logoBl.width / 2;
		logoBl.y = 210 - logoBl.height / 2-50;
		logoTween = FlxTween.tween(logoBl, {x: 950 - 320 - logoBl.width / 2 }, 0.6, {ease: FlxEase.backInOut});

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(optionShitX[i], optionShitY[i]);
			if(optionShit[i] == 'freeplay')
			{
				menuItem.scale.x = 0.91;
				menuItem.scale.y = 0.91;
			}
			else{
				menuItem.scale.x = 1;
				menuItem.scale.y = 1;
			}
			menuItem.antialiasing = VsliceOptions.ANTIALIASING;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if (optionShit.length < 6)
				scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.updateHitbox();
			//menuItem.screenCenter(X);
		}

		var psychVer:FlxText = new FlxText(0, FlxG.height - 18, FlxG.width, "Psych Engine " + psychEngineVersion, 12);
		var fnfVer:FlxText = new FlxText(0, FlxG.height - 18, FlxG.width, 'v${funkinVersion} (P-slice ${pSliceVersion})', 12);

		psychVer.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		fnfVer.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		
		psychVer.scrollFactor.set();
		fnfVer.scrollFactor.set();
		add(psychVer);
		add(fnfVer);
		//var fnfVer:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' ", 12);
	
		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		// Unlocks "Freaky on a Friday Night" achievement if it's a Friday and between 18:00 PM and 23:59 PM
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) MainMenuHooks.unlockFriday();
			

		#if MODS_ALLOWED
		MainMenuHooks.reloadAchievements();
		#end
		#end

		#if TOUCH_CONTROLS_ALLOWED
		addTouchPad('LEFT_FULL', 'A_B_E');
		#end

		super.create();

		FlxG.camera.follow(camFollow, null, 0.06);
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		logoBl.animation.play('bump');

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			//if (FreeplayState.vocals != null)
				//FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
				changeItem(-1);

			if (controls.UI_DOWN_P)
				changeItem(1);

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
				FlxTransitionableState.skipNextTransIn = false;
				FlxTransitionableState.skipNextTransOut = false;
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://needlejuicerecords.com/pages/friday-night-funkin');
				}
				else
				{
					selectedSomethin = true;

					if (VsliceOptions.FLASHBANG)
						FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					FlxFlicker.flicker(menuItems.members[curSelected], 1, 0.06, false, false, function(flick:FlxFlicker)
					{
						switch (optionShit[curSelected])
						{
							case 'story_mode':
								MusicBeatState.switchState(new StoryMenuState());
							case 'freeplay':{
								persistentDraw = true;
								persistentUpdate = false;
								// Freeplay has its own custom transition
								FlxTransitionableState.skipNextTransIn = true;
								FlxTransitionableState.skipNextTransOut = true;

								openSubState(new FreeplayState());
								subStateOpened.addOnce(state -> {
									for (i in 0...menuItems.members.length) {
										menuItems.members[i].revive();
										menuItems.members[i].alpha = 1;
										menuItems.members[i].visible = true;
										selectedSomethin = false;
									}
									changeItem(0);
								});
								
							}

							#if MODS_ALLOWED
							case 'mods':
								MusicBeatState.switchState(new ModsMenuState());
							#end

							#if ACHIEVEMENTS_ALLOWED
							case 'awards':
								MusicBeatState.switchState(new AchievementsMenuState());
							#end

							case 'credits':
								MusicBeatState.switchState(new CreditsState());
							case 'options':
								MusicBeatState.switchState(new OptionsState());
								#if !LEGACY_PSYCH OptionsState.onPlayState = false; #end
								if (PlayState.SONG != null)
								{
									PlayState.SONG.arrowSkin = null;
									PlayState.SONG.splashSkin = null;
									#if !LEGACY_PSYCH PlayState.stageUI = 'normal'; #end
								}
							case 'week1' | 'week2' | 'week3':
								switch (optionShit[curSelected])
								{
									case 'week1':
										StoryMenuState.curWeek = 1;
									case 'week2':
										StoryMenuState.curWeek = 2;
									case 'week3':
										StoryMenuState.curWeek = 3;
								}
								MusicBeatState.switchState(new StoryMenuState());
						}
					});

					for (i in 0...menuItems.members.length)
					{
						if (i == curSelected)
							continue;
						FlxTween.tween(menuItems.members[i], {alpha: 0}, 0.4, {
							ease: FlxEase.quadOut,
							onComplete: function(twn:FlxTween)
							{
								menuItems.members[i].kill();
							}
						});
					}
				}
			}
			if (#if TOUCH_CONTROLS_ALLOWED touchPad.buttonE.justPressed || #end 
				#if LEGACY_PSYCH FlxG.keys.anyJustPressed(ClientPrefs.keyBinds.get('debug_1').filter(s -> s != -1)) 
				#else controls.justPressed('debug_1') #end)
			{
				selectedSomethin = true;
				FlxTransitionableState.skipNextTransIn = false;
				FlxTransitionableState.skipNextTransOut = false;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'));
		menuItems.members[curSelected].animation.play('idle');
		menuItems.members[curSelected].updateHitbox();
		//menuItems.members[curSelected].screenCenter(X);

		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.members[curSelected].animation.play('selected');
		menuItems.members[curSelected].centerOffsets();
		//menuItems.members[curSelected].screenCenter(X);

		//camFollow.setPosition(menuItems.members[curSelected].getGraphicMidpoint().y - (menuItems.length > 4 ? menuItems.length * 8 : 0)-100);
	}
}
