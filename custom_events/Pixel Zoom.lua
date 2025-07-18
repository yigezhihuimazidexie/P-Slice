--Script by Villagecool, yeah go and use for your own thing, just dont remove this watermark
-- if you wanna credit me in your mod heres my icon -> https://cdn.discordapp.com/attachments/1040970622542565406/1098013024117342309/Villagecool.png
local pixela = false
local pxSize = 0

local shaderName = "pixel"

if not lowQuality then 
function onCreatePost()
    makeLuaSprite(shaderName)

	addPixelShader()
end
function onEvent(n,v1,v2)
    if n == 'Pixel Zoom' then
		pixelate(v1)
    end
end
function onUpdate()
	if pixela == true then
		pxSize = pxSize+0.05
	else
		pxSize = 0.01
	end

    setShaderFloat(shaderName, 'pxSize', pxSize)
end

timers = {}
function ezTimer(tag, timer, callback) -- Better
     table.insert(timers,{tag, callback})
     runTimer(tag, timer)
end

function onTimerCompleted(tag)
     for k,v in pairs(timers) do
          if v[1] == tag then
               v[2]()
          end
     end
end

function pixelate(time)
	pixela = true
    togglePixel(true)
	ezTimer('pixelate', time, function() togglePixel(false) end)
end

function togglePixel(bool)
    if bool == true then
        addPixelShader()
    else
        pixela = false
        pxSize = 0.01
        runHaxeCode([[
            game.camGame.setFilters([]);
            game.camHUD.setFilters([]);
        ]])
    end
end

function addPixelShader()
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";

		game.initLuaShader(shaderName);

		var shader0 = game.createRuntimeShader(shaderName);

		game.camGame.setFilters([new ShaderFilter(shader0)]);
		game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject(shaderName).shader = shader0;
	]])

    setShaderFloat(shaderName, 'pxSize', 0.1)
end
end