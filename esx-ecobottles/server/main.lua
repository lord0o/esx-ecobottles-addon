local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("esx-ecobottles:sellBottles")
AddEventHandler("esx-ecobottles:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)

    local currentBottles = player.getInventoryItem("bottle")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
        local randomMoney = math.random((Config.BottleReward[1] or 10), (Config.BottleReward[2] or 40))

        player.removeInventoryItem("bottle", currentBottles)
        player.addMoney(randomMoney * currentBottles)

        TriggerClientEvent("esx:showNotification", source, ("Entregaste al local %s botellas y recibiste como pago $%s."):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "No tenes botellas vacias para entregarle al local.")
    end
end)

RegisterServerEvent("esx-ecobottles:retrieveBottle")
AddEventHandler("esx-ecobottles:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 1000)
    local randomBottle = math.random((Config.BottleRecieve[1] or 1), (Config.BottleRecieve[2] or 6))
	local randomBandage = math.random((Config.BandageRecieve[1] or 1), (Config.BandageRecieve[2] or 2))--
    --local weaponbottle = math.random ((Config.WeaponBottle[1] or 1), (Config.WeaponBottle[1] or 1)) -- 
	

	
    if luck >= 0 and luck <= 29 then

        TriggerClientEvent("esx:showNotification", source, "No habia nada interesante en la basura.")
		
	end

    if luck >= 30 and luck <= 35 then
		
		player.addInventoryItem("bandage", randomBandage)
		TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~y~Vendaje!"):format(randomBandage))
	end
	

	if luck >= 36 and luck <= 42 then

		player.addInventoryItem("bandage", randomBandage)
		TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~y~Vendaje!"):format(randomBandage))        
		player.addInventoryItem("bottle", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~g~Botellas vacia"):format(randomBottle))
	end
	
	--if luck >= 42 and luck <= 64 then 
		--local player = GetPlayerPed(-1)
		
	--TriggerClientEvent("esx:showNotification", source, "No habia nada interesante en la basura.(BOTELLA ERROR)")
	--	TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~o~Botella Partida! está afilada!"):format(weaponbottle))
	--end	
	
	if luck >= 65 and luck <= 100 then
        
		player.addInventoryItem("bottle", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~g~Botellas vacia"):format(randomBottle))
    
	end
end)



RegisterServerEvent("esx-ecobottles:retrieveShit")
AddEventHandler("esx-ecobottles:retrieveShit", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 1000)
    local randomBottle = math.random((Config.BottleRecieve[1] or 1), (Config.BottleRecieve[2] or 6))
	local randomBandage = math.random((Config.BandageRecieve[1] or 1), (Config.BandageRecieve[2] or 2))--
	

	
    if luck >= 0 and luck <= 29 then

        TriggerClientEvent("esx:showNotification", source, "No habia nada interesante en la basura.")
		
	end

    if luck >= 30 and luck <= 35 then
		
		player.addInventoryItem("bandage", randomBandage)
		TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~y~Vendaje!"):format(randomBandage))
	end
	

	if luck >= 36 and luck <= 42 then

		player.addInventoryItem("bandage", randomBandage)
		TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~y~Vendaje!"):format(randomBandage))        
		player.addInventoryItem("bottle", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~g~Botellas vacia"):format(randomBottle))
	end
	
	--if luck >= 42 and luck <= 64 then 
		--local player = GetPlayerPed(-1)
		
	--TriggerClientEvent("esx:showNotification", source, "No habia nada interesante en la basura.(BOTELLA ERROR)")
	--	TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~o~Botella Partida! está afilada!"):format(weaponbottle))
	--end	
	
	if luck >= 65 and luck <= 100 then
        
		player.addInventoryItem("bottle", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("Encontraste x%s ~g~Botellas vacia"):format(randomBottle))
    
	end
end)