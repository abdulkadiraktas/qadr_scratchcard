scratchdata = {}
allplayers = {}
data = {}

function loadallplayer()	
	TriggerEvent("redemrp:getAllPlayers", function(allusers)
		allplayers = allusers
	end)
end

function checkPrize(identifier)
	local found = false
	for i=1, #scratchdata, 1 do
		if scratchdata[i].user == identifier then
			found = true
			return scratchdata[i].prize
		end
	end
	if found == false then
		table.insert(scratchdata, {user = identifier, stillUsing = false, prize = 0})
		return false
	end
end

function checkCard(identifier)
	local found = false
	for i=1, #scratchdata, 1 do
		if scratchdata[i].user == identifier then
			found = true
			return scratchdata[i].stillUsing
		end
	end
	if found == false then
		table.insert(scratchdata, {user = identifier, stillUsing = true, prize = 0})
		return false
	end
end

function setCard(identifier, bool, prize)
	for i=1, #scratchdata, 1 do
		if scratchdata[i].user == identifier then
			if bool ~= nil then
				scratchdata[i].stillUsing = bool
			end
			if prize ~= nil then
				scratchdata[i].prize = prize
			end
			break
		end
	end
	return
end
