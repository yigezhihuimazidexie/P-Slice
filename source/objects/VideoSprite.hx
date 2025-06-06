package objects;

import substates.PauseSubState;
import flixel.addons.display.FlxPieDial;

#if hxvlc
import hxvlc.flixel.FlxVideoSprite;
#end
#if hxCodec
import hxcodec.flixel.FlxVideoSprite;
#end

class VideoSprite extends FlxSpriteGroup {
	#if VIDEOS_ALLOWED
	public var finishCallback:Void->Void = null;
	public var onSkip:Void->Void = null;

	final _timeToSkip:Float = 1;
	public var holdingTime:Float = 0;
	public var videoSprite:FlxVideoSprite;
	public var cover:FlxSprite;
	public var canSkip:Bool = false;

	private var videoName:String;

	public var waiting:Bool = false;
	public var didPlay:Bool = false;

	var pauseJustClosed:Bool = false;

	private var doWeLoop:Bool = false; // for hxCodec

	public function new(videoName:String, isWaiting:Bool, canSkip:Bool = false, shouldLoop:Dynamic = false) {
		super();

		this.doWeLoop = shouldLoop;
		this.videoName = videoName;
		scrollFactor.set();
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

		waiting = isWaiting;
		if(!waiting)
		{
			cover = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
			cover.scale.set(FlxG.width + 100, FlxG.height + 100);
			cover.screenCenter();
			cover.scrollFactor.set();
			add(cover);
		}

		// initialize sprites
		videoSprite = new FlxVideoSprite();
		videoSprite.antialiasing = ClientPrefs.data.antialiasing;
		add(videoSprite);
		if(canSkip) this.canSkip = true;

		// callbacks
		if(!shouldLoop) videoSprite.bitmap.onEndReached.add(finishVideo);
		#if hxvlc
		videoSprite.bitmap.onFormatSetup.add(function()
		#else
		videoSprite.bitmap.onTextureSetup.add(function()
		#end
		{
			/*
			#if hxvlc
			var wd:Int = videoSprite.bitmap.formatWidth;
			var hg:Int = videoSprite.bitmap.formatHeight;
			trace('Video Resolution: ${wd}x${hg}');
			videoSprite.scale.set(FlxG.width / wd, FlxG.height / hg);
			#end
			*/
			videoSprite.setGraphicSize(FlxG.width);
			videoSprite.updateHitbox();
			videoSprite.screenCenter();
		});
		// start video and adjust resolution to screen size
		#if hxvlc
		videoSprite.load(videoName, shouldLoop ? ['input-repeat=65545'] : null);
		#end
	}

	var alreadyDestroyed:Bool = false;
	override function destroy()
	{
		if(alreadyDestroyed)
			return;

		trace('Video destroyed');
		if(cover != null)
		{
			remove(cover);
			cover.destroy();
		}

		finishCallback = null;
		onSkip = null;

		if(FlxG.state != null)
		{
			if(FlxG.state.members.contains(this))
				FlxG.state.remove(this);

			if(FlxG.state.subState != null && FlxG.state.subState.members.contains(this))
				FlxG.state.subState.remove(this);
		}
		super.destroy();
		alreadyDestroyed = true;
	}

	override function update(elapsed:Float)
	{
		if (Controls.instance.pressed('pause') #if android || FlxG.android.justReleased.BACK #end && !pauseJustClosed && PlayState.instance != null )
			{
				var game = PlayState.instance;
					FlxG.camera.followLerp = 0;
					FlxG.state.persistentUpdate = false;
					FlxG.state.persistentDraw = true;
					pause();
					game.paused = true;
					var pauseState = new PauseSubState(true,VIDEO);
					pauseState.cutscene_allowSkipping = canSkip;
					pauseState.cutscene_hardReset = false;
					pauseJustClosed = true; // solely to prevent double-pausing
					game.openSubState(pauseState);

					game.subStateClosed.addOnce(s ->{ //TODO
						switch (pauseState.specialAction){
							case SKIP:{
								//finishCallback = null;
								videoSprite.bitmap.onEndReached.dispatch();
								PlayState.instance.remove(this);
								trace('Skipped video');
							}
							case RESUME:{
								resume();
								FlxTimer.wait(0.4,() -> pauseJustClosed = false);
							}
							case NOTHING:{
								finishCallback = null;
							}
							case RESTART:{
								videoSprite.bitmap.time = 0;
								FlxTimer.wait(0.8,() -> pauseJustClosed = false);
								resume();
							}
						}
						
					});
			}
		super.update(elapsed);
	}
	function finishVideo()
		{
			if (!alreadyDestroyed)
			{
				if(finishCallback != null)
					finishCallback();
	
				destroy();
			}
		}
	public function resume() videoSprite?.resume();
	public function pause() videoSprite?.pause();

	public function play() {
		#if hxvlc
		videoSprite.play();
		#else
		videoSprite.play(videoName, doWeLoop);
		if (FlxG.autoPause)
		{
			FlxG.signals.focusGained.remove(videoSprite.resume);
			FlxG.signals.focusLost.remove(videoSprite.pause);
		}
		#end
	}

	#end
}