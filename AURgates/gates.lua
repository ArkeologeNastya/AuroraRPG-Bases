local gatesTable = {

    --------------------------------------------------------------------

    ------------------- ADD HERE AS MUCH GATES YOU WANT! ---------------

    -- EXAMPLE: {ObjectgateID, closedX, closedY, closedZ, closedRoationX, closedRoationY, closedRoationZ, openX, openY, openZ, openSpeed, colSize, groupName, Team

    -- NOTE: If the base is for a group only just add nil on the place where the team should be

    --------------------------------------------------------------------
    --------------------------------------------------LAW GROUPS-------------------------------------------------
   
	--SAPD
   {980, 2851.078125,-329.0029296875,10.286399841309, 0, 0, 90, 2851.078125,-329.0029296875,17.286399841309, 1000, 12, "SAPD", "SAPD"}, 
   {3114, 2929.900390625,-281.900390625,1, 90, 0, 158.74694824219, 2929.900390625,-281.900390625,12, 1000, 12, "SAPD", "SAPD"}, 
	--createObject ( 980, 1967.6, -313.79999, 37.1 ),
    --MF

    {2929, 215.86816, 1875.67871, 13.9,0,0,0, 220, 1875.67871, 13.9,1000,12,"Military Forces"},

    {2927, 211.89999, 1875.67896, 13.85,0,0,0,207.7, 1875.67871, 13.85,1000,12,"Military Forces"},

    {986, 343.15, 1792.48, 18.79, 0, 0, 38,343.15, 1792.48, 10,1000,12,"Military Forces"},

    {986, 349.7, 1797.19, 18.79, 0, 0, 38,349.7, 1797.19, 10,1000,12,"Military Forces"},

    {985, 90.5, 1925, 18.55, 0, 0, 90,90.5, 1931.19995, 18.55,1000,12,"Military Forces"},

    {986, 90.5, 1917.09961, 18.55, 0, 0, 90,90.5, 1911.40002, 18.55,1000,12,"Military Forces"},

    {985, 138.89999, 1941.40002, 19.98,0,0,0,144.60001, 1941.40002, 19.98,1000,12,"Military Forces"},

    {986, 131, 1941.40002, 19.98,0,0,0,124.5, 1941.40002, 19.98,1000,12,"Military Forces"},

    --Staff--

	{980, 1808.2000000, -3090.8000000, 3,0,0,0, 1808.2000000, -3090.8000000, -10,1000,12},
	-- HQ
	{980,-2486.02,-614.5,134,0,0,90,-2486.02,-614.5,125,900,8,"HQ","HQ"},


    ----------------------------------------------- CRIMINAL GROUPS------------------------------------------------

	-- CO

	{980,2986.7514648438,2120.9,10.8445386886597,0,0,90, 2986.7514648438,2129.9,1.3445386886597, 400, 8.0, "Criminal Organization"},
	-- SM

	{ 971, 1927.4, 615.09961, 16.6,0,0,0, 1937.4, 615.09961, 16.6, 400, 8.0, "The Smurfs"},
	{ 971, 1918.5, 615.09961, 16.6,0,0,0, 1908.5, 615.09961, 16.6, 400, 8.0, "The Smurfs"},




   --------------------------------------------- EVERYONE-------------------------------------------------------

    --Dice

    {10150,1975.58, -3529.1, 4.64,0,0,90,1975.58, -3529.1, 0.33,5000,0.1,"NoGROUP",command="opendoor34",scale=1.1},

    {10150,1975.34, -3523.37, 4.64,0,0,90,1975.34, -3523.37, 0.33,5000,0.1,"NoGROUP",command="opendoor34",scale=1.1},

    {10150,2001.79, -3529.17, 4.64,0,0,90,2001.79, -3529.27, 0.33,5000,0.1,"NoGROUP",command="opendoor34",scale=1.1},

    {10150,2001.67, -3523.48, 4.64,0,0,90,2001.67, -3523.46, 0.33,5000,0.1,"NoGROUP",command="opendoor34",scale=1.1},



    {10150, 1991.58, -3513.31, 4.64,0,0,0, 1991.58, -3513.31, 0.33,5000,0.1,"NoGROUP",command="opendoor34",scale=1.1},

    {10150,1985.6, -3513.54, 4.64,0,0,0,1985.65, -3513.54, 0.33,5000,0.1,"NoGROUP",command="opendoor34",scale=1.1},

    {10150,1991.54, -3538.47, 4.64,0,0,-2,1991.54, -3538.47, 0.33,5000,0.1,"NoGROUP",command="opendoor34",scale=1.1},

    {10150,1985.65, -3538.9, 4.64,0,0,0,1985.65, -3538.9, 0.33,5000,0.1,"NoGROUP",command="opendoor34",scale=1.1},

    --maze

    {3115, 4375.5, -717.59998, 0,270,0,90,4375.5, -717.59998, -10,5000,0.1,"NoGROUP",command="openmaze",scale=1.1},
    -- KOD
    {971,-5084.2002, -3099.1001, 5.4,0,0,0,-5084.2002, -3099.1001, 10.4,5000,0.1,"NoGROUP",command="kodgate",scale=1.1},

    --------------------------------------------------------------------

    -------------- CHANGE ONLY STUFF BETWEEN THIS AND ABOVE ------------

    --------------------------------------------------------------------

}



theGateID = {}

theGateElement = {}

moving = {}

open={}

for i=1,30 do moving[i]=false open[i]=false end

function isLaw(p)

    local name = getTeamName(getPlayerTeam(p))

    if name == "Government" or name == "Government Agency" or name == "SWAT" or name == "Military Forces" or name == "Staff" then return true end

    return false

end


function gateOpen ( hitElement, matchingDimension,col)

if (col) then source=col end

local theGate = theGateElement[source] -- source is col, in die table zitten cols gelinked aan hun gate object; als je terug ben upload dit en kijk of het werkt

    if (theGate) and (getElementType(hitElement) == "player") and (theGateID[theGate]) then

        local ID = theGateID[theGate]

        if open[ID]==true then return end

        --if moving[ID]==true then return end

        local x,y,z = getElementPosition ( theGate ) -- hoe kom je aan theGate? ik denk dat ie een andere opent. Ik denk dat dit werkt

        if ((getElementType(hitElement) == "player" and matchingDimension) or (col) ) then

            if (gatesTable[ID].mustBeInVeh) then if isPedInVehicle(hitElement) == false then return end end

            if (col) then hitElement=col end

            if (getElementDimension(hitElement) == 0) then

                local x2, y2, z2 = getElementPosition(hitElement)

                if ((col) or ((z2 < gatesTable[ID][4] +5) and (z2 > gatesTable[ID][4] -5)) or (gatesTable[ID].gateColZ ~= nil and (z2 < gatesTable[ID].gateColZ +5) and (z2 > gatesTable[ID].gateColZ -5))) then

                    if ((col) or (exports.server:getPlayerGroupName(hitElement) and ((exports.server:getPlayerGroupName(hitElement) == gatesTable[ID][13] or ((gatesTable[ID].secondGroup) and exports.server:getPlayerGroupName(hitElement) == gatesTable[ID].secondGroup)) or  (getPlayerTeam(hitElement) or checkAllianceAccess(hitElement)) and getTeamName(getPlayerTeam(hitElement)) == "Staff" )) or (getPlayerTeam(hitElement) and getTeamName(getPlayerTeam(hitElement)) == gatesTable[ID][14] )) then
                        if gatesTable[ID][13] ~= nil and gatesTable[ID][13] == "LAW" then

                            if moving[ID]==true then return end

                        end

                        if gatesTable[ID][15] ~= nil then

                            moveObject( theGate, gatesTable[ID][11], gatesTable[ID][8], gatesTable[ID][9], gatesTable[ID][10],gatesTable[ID][15],gatesTable[ID][16],gatesTable[ID][17] )

                            moving[ID]=true

                            open[ID]=true

                            setTimer(function() moving[ID]=false end,gatesTable[ID][11]+500,1)

                        else

                            moving[ID]=true

                            open[ID]=true

                            setTimer(function() moving[ID]=false end,gatesTable[ID][11]+500,1)

                            moveObject( theGate, gatesTable[ID][11], gatesTable[ID][8], gatesTable[ID][9], gatesTable[ID][10] ) -- geen errors, geen move, niks, rest allemaal wel

                        end

                    elseif gatesTable[ID][13] == "LAW" then

                        if moving[ID]==true then return end

                        if isLaw(hitElement) == true then

                            moving[ID]=true

                            open[ID]=true

                            setTimer(function() moving[ID]=false end,gatesTable[ID][11]+500,1)

                            moveObject( theGate, gatesTable[ID][11], gatesTable[ID][8], gatesTable[ID][9], gatesTable[ID][10],gatesTable[ID][15],gatesTable[ID][16],gatesTable[ID][17] )

                        end

                    elseif gatesTable[ID][13] == "ALL" then

                        if moving[ID]==true then return end

                        --if isLaw(hitElement) == true then

                            moving[ID]=true

                            open[ID]=true

                            setTimer(function() moving[ID]=false end,gatesTable[ID][11]+500,1)

                            moveObject( theGate, gatesTable[ID][11], gatesTable[ID][8], gatesTable[ID][9], gatesTable[ID][10],gatesTable[ID][15],gatesTable[ID][16],gatesTable[ID][17] )

                        --end
					elseif gatesTable[ID][13] == "HQ" then
						if moving[ID]==true then return end
						setElementData(hitElement,"hqGateMarker",theGate)
						triggerClientEvent(hitElement,"requestHQPassword",hitElement,ID)
                    end

                end

            end

        end

    end

end

addEvent("openHQGate",true)
addEventHandler("openHQGate",root,function(ID)
	local marker = getElementData(source,"hqGateMarker")
	if marker and isElement(marker) then
		if moving[ID] == false then
			outputDebugString("open HQ")
			moving[ID]=true
			open[ID]=true
			moveObject( marker, gatesTable[ID][11], gatesTable[ID][8], gatesTable[ID][9], gatesTable[ID][10],gatesTable[ID][15],gatesTable[ID][16],gatesTable[ID][17] )
			setTimer(function(myid,mr)
				stopObject(mr)
				moveObject( mr,gatesTable[myid][11], gatesTable[myid][2], gatesTable[myid][3], gatesTable[myid][4] )
				--setElementPosition(mr,-2486.02,-614.5,134)
				moving[myid]=false
				open[myid] = false
			end,5000,1,ID,marker)
		end
	end
end)



function gateClose (hitElement, matchingDimension, col )

if (col) then source=col end

local theGate = theGateElement[source]

    if (theGate) and (getElementType(hitElement) == "player") then

        local ID = theGateID[theGate]

        if open[ID]==false then return end

        --if moving[ID]==true then return end

        local x,y,z = getElementPosition ( theGate )

        if ((getElementType(hitElement) == "player" and matchingDimension) or (col) ) then

        if (gatesTable[ID].mustBeInVeh) then if isPedInVehicle(hitElement) == false then return end end

            if (col) then hitElement=col end

            local x2, y2, z2 = getElementPosition(hitElement)

            if ((z2 < gatesTable[ID][4] +5) and (z2 > gatesTable[ID][4] -5)) or (gatesTable[ID].gateColZ ~= nil and (z2 < gatesTable[ID].gateColZ +5) and (z2 > gatesTable[ID].gateColZ -5)) then

                if ((col) or (exports.server:getPlayerGroupName(hitElement) and ((exports.server:getPlayerGroupName(hitElement) == gatesTable[ID][13] or ((gatesTable[ID].secondGroup) and exports.server:getPlayerGroupName(hitElement) == gatesTable[ID].secondGroup)) or  (getPlayerTeam(hitElement) or checkAllianceAccess(hitElement)) and getTeamName(getPlayerTeam(hitElement)) == "Staff" )) or (getPlayerTeam(hitElement) and getTeamName(getPlayerTeam(hitElement)) == gatesTable[ID][14] )) then

                    if gatesTable[ID][13] ~= nil and gatesTable[ID][13] == "LAW" then

                            if moving[ID]==true then return end

                        end

                    if gatesTable[ID][15] ~= nil then

                        moving[ID]=true

                        open[ID]=false

                        setTimer(function() moving[ID]=false end,gatesTable[ID][11]+500,1)

                        moveObject( theGate, gatesTable[ID][11], gatesTable[ID][2], gatesTable[ID][3], gatesTable[ID][4], gatesTable[ID][18], gatesTable[ID][19], gatesTable[ID][20] )

                    else

                        moving[ID]=true

                        open[ID]=false

                        setTimer(function() moving[ID]=false end,gatesTable[ID][11]+500,1)

                        moveObject( theGate, gatesTable[ID][11], gatesTable[ID][2], gatesTable[ID][3], gatesTable[ID][4] )

                    end

                elseif gatesTable[ID][13] == "LAW" then

                    if moving[ID]==true then return end

                    if isLaw(hitElement) == true then

                        moving[ID]=true

                        open[ID]=false

                        setTimer(function() moving[ID]=false end,gatesTable[ID][11]+500,1)

                        moveObject( theGate, gatesTable[ID][11], gatesTable[ID][2], gatesTable[ID][3], gatesTable[ID][4], gatesTable[ID][18], gatesTable[ID][19], gatesTable[ID][20] )

                    end

                elseif gatesTable[ID][13] == "ALL" then

                    if moving[ID]==true then return end

                    --if isLaw(hitElement) == true then

                        moving[ID]=true

                        open[ID]=false

                        setTimer(function() moving[ID]=false end,gatesTable[ID][11]+500,1)

                        moveObject( theGate, gatesTable[ID][11], gatesTable[ID][2], gatesTable[ID][3], gatesTable[ID][4], gatesTable[ID][18], gatesTable[ID][19], gatesTable[ID][20] )

                    --end

                end

            end

        end

    end

end



--[[



function checkAllianceAccess(v)

    local a = getElementData(v,"alliance")

    if (a) then

        local t = exports.CSGgroups:alliances_getAllianceSettings(tonumber(a))

        if (t.shareGates) == true then

            return true

        else

            return false

        end

    end

end



]]

gateShaderTable={}

function newShaderGate(gate,v)

    local t = {}

    table.insert(t,{gate,v})

    table.insert(gateShaderTable,{gate,v})

    setTimer(function()

    for k,player in pairs(getElementsByType("player")) do

   --     triggerClientEvent(player,"recCustomGatesList",player,t)

    end

    end,5000,1)

end



addEventHandler("onPlayerLogin",root,function()

  --  triggerClientEvent(source,"recCustomGatesList",source,gateShaderTable)

end)



for ID, gates in ipairs(gatesTable) do

    local theGateCol = false

    if gates.gateColZ == nil then

        theGateCol=createColSphere ( gates[2], gates[3], gates[4], gates[12] )

    else

        theGateCol= createColSphere ( gates[2], gates[3], gates.gateColZ, gates[12] )



    end

    local theGate = createObject ( gates[1], gates[2], gates[3], gates[4], gates[5], gates[6], gates[7] )

    theGateElement[theGateCol] = theGate

    theGateID[theGate] = ID

    if gates.scale ~= nil then setObjectScale(theGate,gates.scale) end

    if gates.image ~= nil then

        newShaderGate(theGate,gates.image)

    end

    if gates.command ~= nil then

        addCommandHandler(gates.command,function(ps)



            local id = ID

            if open[ID] == true then

                --if gates.command == "togdice" then

                --  setTimer(function() gateClose(ps,true,theGateCol) end,math.random(2500),1)

                --else

                    gateClose(ps,true,theGateCol)

                --end



            else

                --if gates.command == "togdice" then

                --  setTimer(function() gateOpen(ps,true,theGateCol) end,math.random(2500),1)

                --else

                    gateOpen(ps,true,theGateCol)

                --end



            end

        end)

    end

    addEventHandler( "onColShapeHit", theGateCol, gateOpen )

    addEventHandler( "onColShapeLeave", theGateCol, gateClose )

end





--