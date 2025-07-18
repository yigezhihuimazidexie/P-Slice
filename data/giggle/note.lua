
function onUpdate()
	--if (songName == 'am-ata-caite')==false then
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums', i, 'texture', 'errorNOTE_assets');
	end
	--end
end