-- Table with positions
local positionTable = {
    { 223.5,1870.22,13.14, 3, "Law",1242 }, -- MF
    { 2912.7856445313,-280.69134521484,8.9078121185303, 3, "Law",1242 }, -- SAPD
    { 3323.48,2131.34,13.73, 4, "Criminals",1242 }, -- Co
    { 3300.3171386719,2126.9792480469,3.0959475040436, 4, "Criminals",1242 }, -- Sm
    { 1933.7652587891,563.30737304688,22.270313262939, 4, "Criminals",1242 }, -- Sm



}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------YOU CAN ONLY MODIFY WHAT'S FIGURED UPSIDE-------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local CD={}
-- Table with pickups in
local pickupsTable = {}
local pickupsTable2 = {}

-- Create the pickups
for i=1,#positionTable do
    pickupsTable [ createPickup ( positionTable[i][1], positionTable[i][2], positionTable[i][3], 3, positionTable[i][6], 0 ) ] = { positionTable[i][4], positionTable[i][5] }
	pickupsTable2 = createMarker( positionTable[i][1], positionTable[i][2], positionTable[i][3],"corona",0.8,0,255,0,50)
end

-- On pickup hit
addEventHandler( "onPickupHit", root,
    function ( thePlayer )
        if ( pickupsTable[ source ] ) and not ( isPedInVehicle( thePlayer ) ) and ( getPlayerTeam( thePlayer ) ) then
            if ( pickupsTable[ source ][2] == getTeamName( getPlayerTeam( thePlayer ) ) ) or ( pickupsTable[ source ][2] == "Law" ) and ( exports.DENlaw:isPlayerLawEnforcer( thePlayer ) ) then
                if CD[thePlayer] == nil then CD[thePlayer]=false end
                if CD[thePlayer] == true then
                    exports.NGCdxmsg:createNewDxMessage(thePlayer,"You can't get this pickup at the moment, try again in a few seconds.",0,255,0)
                    cancelEvent()
                    return
                else

                CD[thePlayer]=true
                setTimer(function() CD[thePlayer]=false end,60000,1)
                if pickupsTable[ source ][2] == "Law" and getTeamName(getPlayerTeam(thePlayer)) ~= "Government Agency" then
                    giveWeapon(thePlayer,44,1)
                end
                if ( pickupsTable[ source ][1] == 1 ) then ---- armor
                    setPedArmor( thePlayer, 100 )
                elseif ( pickupsTable[ source ][1]  == 2 ) then --- armor and para
                    setPedArmor( thePlayer, 100 )
                    giveWeapon( thePlayer, 46, 1, true )
                elseif ( pickupsTable[ source ][1]  == 3 ) then --- health,armor and para
                    setPedArmor( thePlayer, 100 )
                    setElementHealth( thePlayer, 200 )
                    giveWeapon( thePlayer, 46, 1, true )
                elseif ( pickupsTable[ source ][1]  == 4 ) then -- health and armor
                    setPedArmor( thePlayer, 100 )
                    setElementHealth( thePlayer, 200 )
                elseif ( pickupsTable[ source ][1]  == 5 ) then --- health
                    setPedArmor( thePlayer, 100 )
                    setElementHealth( thePlayer, 200 )
                elseif ( pickupsTable[ source ][1]  == 6 ) then --- para
                    giveWeapon( thePlayer, 46, 1, true )
                end
                end
            else
                cancelEvent()
            end
        end
    end
)