function onCreate() 
    if shadersEnabled then  
        local ShaderName = 'tv'
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        scaleObject("camShader", 20.0, 20.0)
        setSpriteShader('camShader', ShaderName)
        

        runHaxeCode([[
            trace(game.getLuaObject('camShader').shader + ' Has Been Loaded!');                      
            FlxG.game.setFilters([new ShaderFilter(game.getLuaObject('camShader').shader)]);
            //game.camGame.setFilters([new ShaderFilter(game.getLuaObject('camShader').shader)]);
        ]])
skibidi=0.0001
local memuerotio = false

function onUpdate(elapsed)
            if skibidi <=0.45 and curStep >=1 then
                skibidi=skibidi+0.00001*1.5
            end
            setShaderFloat('camShader', 'iTime', os.clock())
            setShaderFloat('camShader', 'iIntensity', 0.025/2)
            setShaderFloat('camShader', 'iTimescale', 0.7)
            
        end
    end
end

function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end
