function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Markov Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/MARKOVNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); -- make it so original character doesn't sing these notes
			setPropertyFromGroup('unspawnNotes',i,'ignoreNote', true)
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.useGlobalShader', true);
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
-- taken from Fanmade Gunfight Hank mod

function goodNoteHit(id, noteData, noteType, isSustainNote)
	health = getProperty('health')
	if noteType == 'Markov Note' then

		setProperty('health', health- 500);
	end
end

