ESX                           = nil

local cachedBins = {}
local cachedShit = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)

    for locationIndex = 1, #Config.SellBottleLocations do
        local locationPos = Config.SellBottleLocations[locationIndex]

        local blip = AddBlipForCoord(locationPos)

        SetBlipSprite (blip, 409)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 48)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Vender Botellas Vacias")
        EndTextCommandSetBlipName(blip)
    end

    while true do
        local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for locationIndex = 1, #Config.SellBottleLocations do
            local locationPos = Config.SellBottleLocations[locationIndex]

            local dstCheck = GetDistanceBetweenCoords(pedCoords, locationPos, true)

            if dstCheck <= 5.0 then
                sleepThread = 5

                local text = "Vender Botellas Vacias"

                if dstCheck <= 1.5 then
                    text = "[~g~E~s~] " .. text

                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("esx-ecobottles:sellBottles")
                    end
                end
                
                ESX.Game.Utils.DrawText3D(locationPos, text, 0.8)
            end
        end

        Citizen.Wait(sleepThread)
    end
end)



Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local entity, entityDst = ESX.Game.GetClosestObject(Config.BinsAvailable)
		local binCoords = GetEntityCoords(entity)
		if DoesEntityExist(entity) then
			while GetDistanceBetweenCoords(playerCoords,binCoords) <= 2.0 do
				binCoords = GetEntityCoords(entity)
				playerCoords = GetEntityCoords(playerPed)
				ESX.Game.Utils.DrawText3D(binCoords + vector3(0.0, 0.0, 0.5), "[~g~E~s~] Revisar basura", 0.8)
				if IsControlJustReleased(0, 38) then
					if not cachedBins[entity] then
						cachedBins[entity] = true
						OpenTrashCan()
					else
						ESX.ShowNotification("~r~Ya revisaste esta basura!")
					end
				end
				Citizen.Wait(0)
			end
		end
		Citizen.Wait(1000)
	end
end)

--NUEVO
Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		--
		--local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
		--local Mierda = GetClosestObjectOfType(playerPedPos, 4.0, GetHashKey(Config.ShitAvailable), false, false, false) 
		--
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local entity, entityDst = ESX.Game.GetClosestObject(Config.ShitAvailable)
		local hashprop = GetHashKey(entity)
		local propCoords = GetEntityCoords(entity)
		if DoesEntityExist(entity) then
			while GetDistanceBetweenCoords(playerCoords,propCoords) <= 4.0 do
				propCoords = GetEntityCoords(entity)
				playerCoords = GetEntityCoords(playerPed)
				ESX.Game.Utils.DrawText3D(propCoords + vector3(0.0, 0.0, 0.5), "[~g~E~s~] AGARRAR MIERDA", 1.0)
				if IsControlJustReleased(0, 38) then
					if not cachedBins[entity] then
						cachedBins[entity] = true
						OpenShit()
					else
						ESX.ShowNotification("~r~Ya revisaste esta basura!")
					end
				end
				Citizen.Wait(0)
			end
		end
		Citizen.Wait(1000)
	end
end)


         
-- Citizen.CreateThread(function()
    -- Citizen.Wait(100)

    -- while true do
        -- local sleepThread = 1000

        -- local entity, entityDst = ESX.Game.GetClosestObject(Config.BinsAvailable)

        -- if DoesEntityExist(entity) and entityDst <= 2.0 then
            -- sleepThread = 5

            -- local binCoords = GetEntityCoords(entity)

            -- ESX.Game.Utils.DrawText3D(binCoords + vector3(0.0, 0.0, 0.5), "[~g~E~s~] Revisar basura", 0.8)

            -- if IsControlJustReleased(0, 38) then
                -- if not cachedBins[entity] then
                    -- cachedBins[entity] = true

                    -- OpenTrashCan()
                -- else
                    -- ESX.ShowNotification("Ya revisaste esta basura!")
                -- end
            -- end
        -- end

        -- Citizen.Wait(sleepThread)
    -- end
-- end)

function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)

    Citizen.Wait(10000)

    TriggerServerEvent("esx-ecobottles:retrieveBottle")

    ClearPedTasks(PlayerPedId())
end

function OpenShit()

    TriggerServerEvent("esx-ecobottles:retrieveShit")
	ClearPedTasks(PlayerPedId())
end

