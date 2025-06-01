package states;

import objects.AttachedSprite;

class CreditsState extends MusicBeatState
{
    var icon:FlxSprite;
    var nameText:FlxText;
    var descBox:FlxSprite;
    var descText:FlxText;
    var prevButton:FlxButton;
    var nextButton:FlxButton;
    var pageText:FlxText;
    var curPage:Int = 0;
    var creditsData:Array<Dynamic>;

    var isTransitioning:Bool = false;
    var transitionTime:Float = 0.4;

    //《整个代码有一半是人员名单》
        var creditsDataCN:Array<Dynamic> = [
            {name: "Cwy",icon: "Cwy",desc: "主创\n我有点吴语...\n我是vs danke主创纯吴语\n只要6美金即可带走源码",color: "444444",link: "https://example.com"},
            {name: "Star Fison",icon: "Star Fison", desc: "曲师", color: "FF3366", link: "https://example.com"},
            {name: "C-air",icon: "C-air",desc: "曲师",color: "FF3366",link: "https://example.com"},
            {name: "Little_earl",icon: "Little_earl",desc: "曲师",color: "FF3366",link: "https://example.com"},
			{name: "kurino198",icon: "kurino198",desc: "曲师",color: "FF3366",link: "https://example.com"},
            {name: "fg_animator",icon: "fg_animator",desc: "k帧的",color: "FF3366",link: "https://example.com"},
			{name: "Zozzz",icon: "Zozzz",desc: "k帧的\n所以纯吴语这家伙是怎么感觉这个名字长的?",color: "FF3366",link: "https://example.com"},
			{name: "Who",icon: "Who",desc: "k帧的\n不是你谁呀(雾)",color: "FF3366",link: "https://example.com"},
            {name: "gz",icon: "gz",desc: "k帧的\n瓜子二手车(雾)",color: "FF3366",link: "https://example.com"},
            {name: "CM",icon: "CM",desc: "画师\n此人不太爱说话",color: "FF3366",link: "https://example.com"},
            {name: "woofwolf",icon: "woofwolf",desc: "画师",color: "FF3366",link: "https://example.com"},
            {name: "yibo",icon: "yibo",desc: "画师\n一波秒了怎么说(雾)",color: "FF3366",link: "https://example.com"},
            {name: "kabin27",icon: "kabin27",desc: "画师",color: "FF3366",link: "https://example.com"},
            {name: "Yike_Forst",icon: "Yike_Forst",desc: "画师",color: "FF3366",link: "https://example.com"},
            {name: "yf",icon: "yf",desc: "画师\n你这贴图怎么弹道偏上(雾)",color: "FF3366",link: "https://example.com"},
            {name: "Molly",icon: "Molly",desc: "画师",color: "FF3366",link: "https://example.com"},
            {name: "Cwy",icon: "Cwy",desc: "程序员\n哎我去,这不deepseek吗(雾)",color: "FF3366",link: "https://example.com"},
            {name: "枫秋",icon: "maple",desc: "程序员\n哎,你这新手机从哪里来的?\n哦,这是我从手机店买的(雾)\n那么旧的呢?\n当然是去自己家里放着啦(雾)\n那么闲置的物品该怎么办?\n当然是让他闲置着啦(雾)\n\n正经介绍:你好,我是枫秋,以上的吐槽整活皆为我写的(纯整活心理,无恶意),在此,至少在这个版本截至之前我已经换了四个版本和一个引擎(累死我了)",color: "FF3366",link: "https://example.com"},
            {name: "zeeling_A&Q",icon: "Song Haotian",desc: "程序员\ncne专业户(雾)",color: "FF3366",link: "https://example.com"},
            {name: "FGguagua",icon: "FGguagua",desc: "程序员\n呱呱",color: "FF3366",link: "https://example.com"},
            {name: "SourCandy233",icon: "SourCandy233",desc: "程序员\n这糖果有点酸了...",color: "FF3366",link: "https://example.com"},
            {name: "FNF Mobile phone player",icon: "FNF Mobile phone player",desc: "程序员\n嚯,我没什么好说的XD",color: "FF3366",link: "https://example.com"},
            {name: "stone",icon: "stone",desc: "程序员\n有点硬核了(雾)",color: "FF3366",link: "https://example.com"},
            {name: "everyone's friend",icon: "everyone's friend",desc: "程序员\n所以你真是所有人的好朋友吗(雾)",color: "FF3366",link: "https://example.com"},
            {name:'Mikolka9144',			icon:'mikolka',			desc:'The lead for the mod',    color:'2ebcfa',								 link:'https://gamebanana.com/members/3329541'},
			{name:'mcagabe19',			icon:'lily',             desc:'Porter of P-slice for mobile devices and creator of linc_luajit-rewritten (used for mobile builds)', color:'FFE7C0',                     link:'https://youtube.com/@mcagabe19'},
			{name:"Fazecarl",			icon:'fazecarl',			desc:'Made the new logo for P-Slice',   color:'29170a',									link:'https://gamebanana.com/members/2121406'},
			{name:"Mykarm",				icon:'mykarm',			desc:'Made the new icon for P-Slice',   color:'29170a',									link:'https://x.com/cronviersmeat/status/1849059676467417311?s=46&t=4dcTT7PAMkRJ8zYd4LgTow'},
			{name:"Join our community",	icon:"ppslice",			desc:"",						color:"5e36c4",										link:"https://discord.gg/9FCyCqEvRf"},
			{name:"Shadow Mario",		icon:"shadowmario",		desc:"Main Programmer and Head of Psych Engine",    color:"444444",					link:"https://ko-fi.com/shadowmario"},
			{name:"Riveren",				icon:"riveren",			desc:"Main Artist/Animator of Psych Engine",    color:"14967B",						link:"https://x.com/riverennn"},
			{name:"bb-panzu",			icon:"bb",				desc:"Ex-Programmer of Psych Engine",   color:"3E813A",							link:"https://x.com/bbsub3"},
			{name:"crowplexus",			icon:"crowplexus",		desc:"HScript Iris, Input System v3, and Other PRs",    color:"CFCFCF",				link:"https://github.com/crowplexus"},
			{name:"Kamizeta",			icon:"kamizeta",			desc:"Creator of Pessy, Psych Engine's mascot.",    color:"D21C11",				link:"https://www.instagram.com/cewweey/"},
			{name:"MaxNeton",			icon:"maxneton",			desc:"Loading Screen Easter Egg Artist/Animator.",  color:"3C2E4E",	link:"https://bsky.app/profile/maxneton.bsky.social"},
			{name:"Keoiki",				icon:"keoiki",			desc:"Note Splash Animations and Latin Alphabet",   color:"D2D2D2",				link:"https://x.com/Keoiki_"},
			{name:"SqirraRNG",			icon:"sqirra",			desc:"Crash Handler and Base code for\nChart Editor's Waveform",   color:"E1843A",	   link:"https://x.com/gedehari"},
			{name:"EliteMasterEric",		icon:"mastereric",		desc:"Runtime Shaders support and Other PRs",   color:"FFBD40",					link:"https://x.com/EliteMasterEric"},
			{name:"MAJigsaw77",			icon:"majigsaw",			desc:".MP4 Video Loader Library (hxvlc)",   color:"5F5F5F",						link:"https://x.com/MAJigsaw77"},
			{name:"Tahir Toprak Karabekiroglu",	icon:"tahir",	desc:"Note Splash Editor and Other PRs",    color:"A04397",							link:"https://x.com/TahirKarabekir"},
			{name:"iFlicky",				icon:"flicky",			desc:"Composer of Psync and Tea Time\nAnd some sound effects",  color:"9E29CF",	link:"https://x.com/flicky_i"},
			{name:"KadeDev",				icon:"kade",				desc:"Fixed some issues on Chart Editor and Other PRs",     color:"64A250",			link:"https://x.com/kade0912"},
			{name:"superpowers04",		icon:"superpowers04",	desc:"LUA JIT Fork",    color:"B957ED",												link:"https://x.com/superpowers04"},
			{name:"CheemsAndFriends",	icon:"cheems",			desc:"Creator of FlxAnimate",   color:"E1E1E1",									link:"https://x.com/CheemsnFriendos"},
			{name:"ninjamuffin99",		icon:"ninjamuffin99",	desc:"Programmer of Friday Night Funkin'",  color:"CF2D2D",						link:"https://x.com/ninja_muffin99"},
			{name:"PhantomArcade",		icon:"phantomarcade",	desc:"Animator of Friday Night Funkin'",    color:"FADC45",							link:"https://x.com/PhantomArcade3K"},
			{name:"evilsk8r",			icon:"evilsk8r",			desc:"Artist of Friday Night Funkin'",  color:"5ABD4B",							link:"https://x.com/evilsk8r"},
			{name:"kawaisprite",			icon:"kawaisprite",		desc:"Composer of Friday Night Funkin'",    color:"378FC7",							link:"https://x.com/kawaisprite"},
        
        ];

        var creditsDataEN:Array<Dynamic> = [
            {name: "Cwy",icon: "Cwy",desc: "hello world!",color: "444444",link: "https://example.com"},
            {name: "Star Fison",icon: "Star Fison", desc: "曲师", color: "FF3366", link: "https://example.com"},
            {name: "C-air",icon: "C-air",desc: "曲师",color: "FF3366",link: "https://example.com"},
            {name: "Little_earl",icon: "Little_earl",desc: "曲师",color: "FF3366",link: "https://example.com"},
			{name: "kurino198",icon: "kurino198",desc: "曲师",color: "FF3366",link: "https://example.com"},
            {name: "fg_animator",icon: "fg_animator",desc: "k帧的",color: "FF3366",link: "https://example.com"},
			{name: "Zozzz",icon: "Zozzz",desc: "k帧的\n所以纯吴语这家伙是怎么感觉这个名字长的?",color: "FF3366",link: "https://example.com"},
			{name: "Who",icon: "Who",desc: "k帧的\n不是你谁呀(雾)",color: "FF3366",link: "https://example.com"},
            {name: "gz",icon: "gz",desc: "k帧的\n瓜子二手车(雾)",color: "FF3366",link: "https://example.com"},
            {name: "CM",icon: "CM",desc: "画师\n此人不太爱说话",color: "FF3366",link: "https://example.com"},
            {name: "woofwolf",icon: "woofwolf",desc: "画师",color: "FF3366",link: "https://example.com"},
            {name: "yibo",icon: "yibo",desc: "画师\n一波秒了怎么说(雾)",color: "FF3366",link: "https://example.com"},
            {name: "kabin27",icon: "kabin27",desc: "画师",color: "FF3366",link: "https://example.com"},
            {name: "Yike_Forst",icon: "Yike_Forst",desc: "画师",color: "FF3366",link: "https://example.com"},
            {name: "yf",icon: "yf",desc: "画师\n你这贴图怎么弹道偏上(雾)",color: "FF3366",link: "https://example.com"},
            {name: "Molly",icon: "Molly",desc: "画师",color: "FF3366",link: "https://example.com"},
            {name: "Cwy",icon: "Cwy",desc: "程序员\n哎我去,这不deepseek吗(雾)",color: "FF3366",link: "https://example.com"},
            {name: "枫秋",icon: "maple",desc: "程序员\n哎,你这新手机从哪里来的?\n哦,这是我从手机店买的(雾)\n那么旧的呢?\n当然是去自己家里放着啦(雾)\n那么闲置的物品该怎么办?\n当然是让他闲置着啦(雾)\n\n正经介绍:你好,我是枫秋,以上的吐槽整活皆为我写的(纯整活心理,无恶意),在此,至少在这个版本截至之前我已经换了四个版本和一个引擎(累死我了)",color: "FF3366",link: "https://example.com"},
            {name: "zeeling_A&Q",icon: "Song Haotian",desc: "程序员\ncne专业户(雾)",color: "FF3366",link: "https://example.com"},
            {name: "FGguagua",icon: "FGguagua",desc: "程序员\n呱呱",color: "FF3366",link: "https://example.com"},
            {name: "SourCandy233",icon: "SourCandy233",desc: "程序员\n这糖果有点酸了...",color: "FF3366",link: "https://example.com"},
            {name: "FNF Mobile phone player",icon: "FNF Mobile phone player",desc: "程序员\n嚯,我没什么好说的XD",color: "FF3366",link: "https://example.com"},
            {name: "stone",icon: "stone",desc: "程序员\n有点硬核了(雾)",color: "FF3366",link: "https://example.com"},
            {name: "everyone's friend",icon: "everyone's friend",desc: "程序员\n所以你真是所有人的好朋友吗(雾)",color: "FF3366",link: "https://example.com"},
            {name:'Mikolka9144',			icon:'mikolka',			desc:'The lead for the mod',    color:'2ebcfa',								 link:'https://gamebanana.com/members/3329541'},
			{name:'mcagabe19',			icon:'lily',             desc:'Porter of P-slice for mobile devices and creator of linc_luajit-rewritten (used for mobile builds)', color:'FFE7C0',                     link:'https://youtube.com/@mcagabe19'},
			{name:"Fazecarl",			icon:'fazecarl',			desc:'Made the new logo for P-Slice',   color:'29170a',									link:'https://gamebanana.com/members/2121406'},
			{name:"Mykarm",				icon:'mykarm',			desc:'Made the new icon for P-Slice',   color:'29170a',									link:'https://x.com/cronviersmeat/status/1849059676467417311?s=46&t=4dcTT7PAMkRJ8zYd4LgTow'},
			{name:"Join our community",	icon:"ppslice",			desc:"",						color:"5e36c4",										link:"https://discord.gg/9FCyCqEvRf"},
			{name:"Shadow Mario",		icon:"shadowmario",		desc:"Main Programmer and Head of Psych Engine",    color:"444444",					link:"https://ko-fi.com/shadowmario"},
			{name:"Riveren",				icon:"riveren",			desc:"Main Artist/Animator of Psych Engine",    color:"14967B",						link:"https://x.com/riverennn"},
			{name:"bb-panzu",			icon:"bb",				desc:"Ex-Programmer of Psych Engine",   color:"3E813A",							link:"https://x.com/bbsub3"},
			{name:"crowplexus",			icon:"crowplexus",		desc:"HScript Iris, Input System v3, and Other PRs",    color:"CFCFCF",				link:"https://github.com/crowplexus"},
			{name:"Kamizeta",			icon:"kamizeta",			desc:"Creator of Pessy, Psych Engine's mascot.",    color:"D21C11",				link:"https://www.instagram.com/cewweey/"},
			{name:"MaxNeton",			icon:"maxneton",			desc:"Loading Screen Easter Egg Artist/Animator.",  color:"3C2E4E",	link:"https://bsky.app/profile/maxneton.bsky.social"},
			{name:"Keoiki",				icon:"keoiki",			desc:"Note Splash Animations and Latin Alphabet",   color:"D2D2D2",				link:"https://x.com/Keoiki_"},
			{name:"SqirraRNG",			icon:"sqirra",			desc:"Crash Handler and Base code for\nChart Editor's Waveform",   color:"E1843A",	   link:"https://x.com/gedehari"},
			{name:"EliteMasterEric",		icon:"mastereric",		desc:"Runtime Shaders support and Other PRs",   color:"FFBD40",					link:"https://x.com/EliteMasterEric"},
			{name:"MAJigsaw77",			icon:"majigsaw",			desc:".MP4 Video Loader Library (hxvlc)",   color:"5F5F5F",						link:"https://x.com/MAJigsaw77"},
			{name:"Tahir Toprak Karabekiroglu",	icon:"tahir",	desc:"Note Splash Editor and Other PRs",    color:"A04397",							link:"https://x.com/TahirKarabekir"},
			{name:"iFlicky",				icon:"flicky",			desc:"Composer of Psync and Tea Time\nAnd some sound effects",  color:"9E29CF",	link:"https://x.com/flicky_i"},
			{name:"KadeDev",				icon:"kade",				desc:"Fixed some issues on Chart Editor and Other PRs",     color:"64A250",			link:"https://x.com/kade0912"},
			{name:"superpowers04",		icon:"superpowers04",	desc:"LUA JIT Fork",    color:"B957ED",												link:"https://x.com/superpowers04"},
			{name:"CheemsAndFriends",	icon:"cheems",			desc:"Creator of FlxAnimate",   color:"E1E1E1",									link:"https://x.com/CheemsnFriendos"},
			{name:"ninjamuffin99",		icon:"ninjamuffin99",	desc:"Programmer of Friday Night Funkin'",  color:"CF2D2D",						link:"https://x.com/ninja_muffin99"},
			{name:"PhantomArcade",		icon:"phantomarcade",	desc:"Animator of Friday Night Funkin'",    color:"FADC45",							link:"https://x.com/PhantomArcade3K"},
			{name:"evilsk8r",			icon:"evilsk8r",			desc:"Artist of Friday Night Funkin'",  color:"5ABD4B",							link:"https://x.com/evilsk8r"},
			{name:"kawaisprite",			icon:"kawaisprite",		desc:"Composer of Friday Night Funkin'",    color:"378FC7",							link:"https://x.com/kawaisprite"},
        ];
        

    override function create()
    {
        super.create();

        FlxG.mouse.visible = true;

        creditsData = creditsDataCN;
        
        var bg = new FlxBackdrop(Paths.image('menuBG'));
        bg.velocity.set(-30, -30);
        add(bg);
        
        icon = new FlxSprite(50,50).makeGraphic(300, 300, FlxColor.TRANSPARENT);
        add(icon);
        
        nameText = new FlxText(50, 360, 300, "", 24);
        nameText.setFormat(Paths.font("vcr2.ttf"), 36, FlxColor.WHITE, CENTER);
        add(nameText);
        
        descBox = new FlxSprite(400, 50);
        descBox.makeGraphic(FlxG.width - 450, FlxG.height - 100, FlxColor.fromRGB(40, 40, 40, 200));
        descBox.scrollFactor.set();
        add(descBox);
        
        descText = new FlxText(descBox.x + 20, descBox.y + 20, descBox.width - 40, "", 24);
        descText.setFormat(Paths.font("vcr2.ttf"), 28, FlxColor.WHITE, LEFT);
        descText.autoSize = false;
        descText.wordWrap = true;
        add(descText);
        
        prevButton = new FlxButton(50, 450, "prev", function() changePage(-1));
        prevButton.setGraphicSize(300, 80);
        prevButton.label.size = 28;
        prevButton.updateHitbox();
        
        prevButton = new FlxButton(50, 450, "上一页", function() changePage(-1));
        nextButton = new FlxButton(50, 520, "下一页", function() changePage(1));

        function setupButton(btn:FlxButton) {
            btn.setGraphicSize(300, 60);
            btn.updateHitbox();
            btn.label.fieldWidth = btn.width;
            btn.label.setFormat(Paths.font("vcr2.ttf"),28, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
            btn.label.autoSize = false;
            btn.label.wordWrap = false;
            btn.label.offset.y = -5; 
        }

        setupButton(prevButton);
        setupButton(nextButton);
        add(prevButton);
        add(nextButton);

        pageText = new FlxText(50, 600, 300, "Page 1/" + creditsData.length, 24);
        pageText.setFormat(Paths.font("vcr2.ttf"), 24, FlxColor.WHITE, CENTER);
        add(pageText);

        
        
        updateContent();
    }

    function updateContent()
    {
        var data = creditsData[curPage];
        
        icon.makeGraphic(300, 300, FlxColor.TRANSPARENT);

        if(data.icon != null && data.icon != ""){
            icon.loadGraphic(Paths.image('credits/${data.icon}'));
            icon.setGraphicSize(300, 300);
            icon.updateHitbox();
        }
        else
        {
            //是的,什么都不执行,你问我不执行为啥还要写else,我也不知道XD
        }
        
        nameText.text = data.name;
        if(data.color != null){
            var color = FlxColor.fromString('#' + data.color);
            nameText.color = (color != null) ? color : FlxColor.WHITE;
        }
        
        descText.text = data.desc;
        
        //prevButton.visible = curPage > 0;
        //nextButton.visible = curPage < creditsData.length - 1;

        pageText.text = "Page " + (curPage + 1) + "/" + creditsData.length;
    }

    function changePage(change:Int)
    {
        if (isTransitioning) return;
    
        isTransitioning = true;
        FlxG.sound.play(Paths.sound('scrollMenu'));
        
        FlxTween.tween(icon, {alpha: 0, x: icon.x - 50}, transitionTime/2, {ease: FlxEase.quadOut});
        FlxTween.tween(nameText, {alpha: 0}, transitionTime/2);
        FlxTween.tween(descBox, {alpha: 0}, transitionTime/2); 
        FlxTween.tween(descText, {alpha: 0}, transitionTime/2, {
            onComplete: function(_) {
                curPage = FlxMath.wrap(curPage + change, 0, creditsData.length - 1);
                updateContent();

                icon.x += 150;
                nameText.y += 20;
                descBox.y -= 30;
                
                FlxTween.tween(icon, {alpha: 1, x: icon.x - 100}, transitionTime, {ease: FlxEase.quadOut});
                FlxTween.tween(nameText, {alpha: 1, y: nameText.y - 20}, transitionTime, {ease: FlxEase.quadOut});
                FlxTween.tween(descBox, {alpha: 1, y: descBox.y + 30}, transitionTime, {ease: FlxEase.quadOut});
                FlxTween.tween(descText, {alpha: 1}, transitionTime, {
                    onComplete: function(_) {
                        isTransitioning = false;
                    }
                });
            }
        });
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);
        
        if (FlxG.keys.justPressed.LEFT) changePage(-1);
        if (FlxG.keys.justPressed.RIGHT) changePage(1);
        if (FlxG.keys.justPressed.ENTER) FlxG.openURL(creditsData[curPage].link);

        if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
        
        if(FlxG.mouse.justPressed && descBox.overlapsPoint(FlxG.mouse.getPosition())){
            FlxG.openURL(creditsData[curPage].link);
        }
    }
}