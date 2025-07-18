function onCreate()
    setProperty('gf.x', getProperty('gf.x') - 125)
	setProperty('gf.y', getProperty('gf.y') - 50)
end

function onBeatHit()
	if curBeat == 135 then
        setProperty('gf.x', getProperty('gf.x') - 125)
	    setProperty('gf.y', getProperty('gf.y') - 50)
	    close(true);
	end
end