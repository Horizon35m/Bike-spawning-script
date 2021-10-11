
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            for i = 1, #locations, 1 do
                loc = locations[i]
                DrawMarker(
                    loc.marker,
                    loc.pos.x,  
                    loc.pos.y,
                    loc.pos.z-.99,
                    0.0, 
                    0.0,
                    0.0, 
                    0.0,
                    0.0,
                    0.0,
                    loc.scale,
                    loc.scale,
                    loc.scale,
                    loc.rgba[1],
                    loc.rgba[2],
                    loc.rgba[3],
                    loc.rgba[4],
                    false,
                    true,
                    2,
                    nil,
                    nil,
                    false
                )
                if loc.submarker ~= nil then DrawMarker(
                    loc.submarker.marker,loc.pos.x,loc.pos.y,loc.submarker.posz,
                    0.0,0.0,0.0,0.0,0.0,0.0,
                    loc.scale/2,loc.scale/2,loc.scale/2,
                    loc.rgba[1],loc.rgba[2],loc.rgba[3],loc.rgba[4],
                    false,true,2,nil,nil,false) end
                local playerCoord = GetEntityCoords(PlayerPedId(), false)
                local locVector = vector3(loc.pos.x, loc.pos.y, loc.pos.z)
                if GetDistanceBetweenCoords(playerCoord, locVector, true) < loc.scale*1.12 and not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    
                    notify("Press E to spawn Bike!")

                    if IsControlPressed(0, 46) then 

                    Citizen.Wait(100)

                        -- change BMX on line 49 and 54 to change what spawns. 

                    RequestModel("BMX")
                    
                    local playerPed = PlayerPedId()
                    local pos = GetEntityCoords(playerPed)

                    local vehicle = CreateVehicle("BMX", pos.x, pos.y, pos.z, false, true)
                    
                    SetPedIntoVehicle(playerPed, vehicle, -1)

                    notify("enjoy your new bike!") 
                end
            end
        end
    end
end)
