TriggerEvent("redemrp_inventory:getData",function(call)
		data = call
end)

loadallplayer()

AddEventHandler("redemrp:playerLoaded", function()
	loadallplayer()
end)

RegisterServerEvent("qadr_scratchcard:prize")
AddEventHandler("qadr_scratchcard:prize", function()
    local _source = source
	local roleplayer = allplayers[_source]
	local identifier = roleplayer.getIdentifier()
	local prize = checkPrize(identifier)
	setCard(identifier, false, nil)
	if prize > 0 then
		roleplayer.addMoney(prize)
	end
end)

RegisterServerEvent("qadr_scratchcard:useCard")
AddEventHandler("qadr_scratchcard:useCard", function()
	local _source = source
	local roleplayer = allplayers[_source]
	local identifier = roleplayer.getIdentifier()
	local chance = math.random(1,100)	
	local prize = 0 
	if chance <= qadr_scratchcard.chance then
		local reward = qadr_scratchcard.prizes
		prize = math.random(reward.min,reward.max)
	end		 
	setCard(identifier, nil, prize)
	TriggerClientEvent("qadr_scratchcard:kartGoster", _source,prize) 
end)

RegisterServerEvent("RegisterUsableItem:scratchcard")
AddEventHandler("RegisterUsableItem:scratchcard", function(source,meta)
	local _source = source
	local roleplayer = allplayers[_source]
	local identifier = roleplayer.getIdentifier()
	local isScratching = checkCard(identifier)
	if isScratching == false then
		setCard(identifier, true)
		local ItemData = data.getItem(_source, "scratchcard")
		ItemData.RemoveItem(1)
		TriggerClientEvent("qadr_scratchcard:useCard", _source)
		TriggerClientEvent("redemrp_inventory:closeinv",_source)
	else
		TriggerClientEvent("redem_roleplay:Tip",_source, "~r~Wait until you'll scratch the current scratch card.", 3000)
	end
end)
