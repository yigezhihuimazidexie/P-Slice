
target = false
function onEvent(n,v1,v2)
	if n == 'camera_target' then
target = v1
setProperty('cameraSpeed', v2)
end
end

function onUpdate()
if target == 'bf' then
cameraSetTarget('boyfriend')
elseif target == 'dad' then
cameraSetTarget('dad')
elseif target == 'gf' then

setProperty('camFollow.y', getMidpointY('gf') + (getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]')))
setProperty('camFollow.x', getMidpointX('gf') + (getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]')))
end
end