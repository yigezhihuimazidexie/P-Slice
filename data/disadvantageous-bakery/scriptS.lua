function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 0.1 then -- 你可以把这个0.1换成任意数（但0.1最好）以更换对手推条的极限（2为整管血），填0会导致对手推条能推死你
       setProperty('health', health- 0.020); -- 更改这个0.0095以调整对手的推条速度，玩家默认的推条速度为0.023
	end
end
