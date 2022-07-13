local isScratching = false
local threshold = 0.5

RegisterNetEvent("qadr_scratchcard:useCard")
AddEventHandler("qadr_scratchcard:useCard", function(type)
	TriggerServerEvent("qadr_scratchcard:useCard", type)
end)

RegisterNetEvent("qadr_scratchcard:kartGoster")
AddEventHandler("qadr_scratchcard:kartGoster", function(prize)
	if isScratching == false then		
		isScratching = true
		Wait(100)
		SetNuiFocus(true, true)
		SendNUIMessage({type = "shownui", value = prize, threshold = threshold})
	end
end)

RegisterNUICallback("closenui", function(data,cb)
	SetNuiFocus(false, false)
	TriggerServerEvent("qadr_scratchcard:prize")
	isScratching = false
	if cb then
		cb({})
	end
end)