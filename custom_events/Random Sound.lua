function onCreate()
    precacheSound('ce')
end

function onEvent(name, value1, value2)
    if name == 'Random Sound' then
        local roll = getRandomInt(1, 100)
        
        if roll <= 100 then 
            playSound('ce', 1)
        end
    end
end