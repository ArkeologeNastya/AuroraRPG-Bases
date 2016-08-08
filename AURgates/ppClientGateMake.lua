--[[local printg = false

addCommandHandler("gatemakemode",function()
	printg = not printg
	if printg == true then
		addEventHandler("onClientPlayerWeaponFire",localPlayer,printgate)
	else
		removeEventHandler("onClientPlayerWeaponFire",localPlayer,printgate)
	end
end)

function printgate(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	local m = getElementModel(hitElement)
	local rx,ry,rz = getElementRotation(hitElement)
	local x,y,z = getElementPosition(hitElement)
	outputChatBox('{'..m..','..x..','..y..','..z..','..rx..','..ry..','..rz..','..x..','..y..','..(z-10)..',600,12,"GROUP"},')
end
]]
