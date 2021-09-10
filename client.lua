local open = false
local done = false

RegisterNUICallback('close', function(data, cb)
    Wait(200)
    open = false
    SendNUIMessage({type = "reset", content = true})
    SetNuiFocus(false,false)
    SetNuiFocusKeepInput(false)
    done = true
    Wait(2000)
    done = false
end)

function CreateProgressBar(seconds,fa,option)
    if option == nil then option = {} end
    local t = {
        fa = fa or '<i class="fad fa-tasks-alt"></i>',
        seconds = seconds
    }
    local playinganimation = false
    SendNUIMessage({type = "create", table = t})
    CreateThread(function()
        local player = PlayerPedId()
        if option.scenario ~= nil then
            TaskStartScenarioInPlace(player, option.scenario, 0, true)
            playinganimation = true
        else
            if option.dict ~= nil and option.name ~= nil then
                
                if option.flag == nil then
                    option.flag = 1
                end
                playinganimation = true
                RequestAnimDict( option.dict )
                while not HasAnimDictLoaded(option.dict) do Citizen.Wait(0) end
                TaskPlayAnim(player,option.dict, option.name, 1.0, -1.0, -1, 0, 1, true, true, true)
            end
        end
    end)
    while not done do Wait(100) end
    local player = PlayerPedId()
    ClearPedTasks(player)
    return done
end

exports('CreateProgressBar', function(seconds,fa,o)
    return CreateProgressBar(seconds,fa,o)
end)

RegisterCommand('prog', function(source, args, rawCommand) -- demo
    local o = {
        --scenario = 'WORLD_HUMAN_AA_COFFEE',
        dict = "random@shop_gunstore",
        name = "_idle_b",
        flag = 1,
    }
    local prog = exports.renzu_progressbar:CreateProgressBar(10,'<i class="fas fa-tools"></i>',o)
end)