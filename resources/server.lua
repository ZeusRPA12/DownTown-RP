local ped = nil

function crearPedUniformes()
	if ped then destroyElement( ped ) end
	ped = createPed( 50,  87.69, -152.05, 2.65 )
	setElementFrozen( ped, true )
	setElementInterior( ped, 0 )
	setElementDimension( ped, 0 )
	setElementRotation( ped, 0, 0, -120 )
end
addEventHandler( "onResourceStart", resourceRoot, crearPedUniformes )
addEventHandler( "onPedWasted", resourceRoot, crearPedUniformes )

addEventHandler( "onElementClicked", getRootElement(),
	function( b, s, player )
		if b == "left" and s == "down" and exports.players:isLoggedIn(player) and exports.factions:isPlayerInFaction( player, 4 ) then
			if source == ped then
				local int, dim = getElementInterior(player), getElementDimension( player )
				local px, py, pz = getElementPosition( player )
				if dim == 0 and int == 0 and getDistanceBetweenPoints3D( px, py, pz, 87.69, -152.05, 2.65 ) < 3 then
					triggerClientEvent( player,"mecanico:abrirVentanaUniformes",player )
				end
			end
		end
	end
)


addEvent ( "onChangeUpgrade", true )
addEventHandler ( "onChangeUpgrade", root,
	function ( upgradeValue )
		local upgrade = tonumber ( upgradeValue )
		local vehicle = getPedOccupiedVehicle ( source )
		if vehicle then
			addVehicleUpgrade ( vehicle, upgrade )
		end
	end
)

addEvent ( "onRemoveUpgrade", true )
addEventHandler ( "onRemoveUpgrade", root,
	function ( upgradeValue )
		local upgrade = tonumber ( upgradeValue )
		local vehicle = getPedOccupiedVehicle ( source )
		if vehicle then
			removeVehicleUpgrade ( vehicle, upgrade )
		end
	end
)




function repararr (thePlayer, command)
if exports.factions:isPlayerInFaction( thePlayer, 4 ) then
local vehicle = getPedOccupiedVehicle(thePlayer)
local money = getPlayerMoney(thePlayer)
    if vehicle and money >= 0 then
	if exports.players:takeMoney( thePlayer, 50 ) then
        fixVehicle(vehicle)
		exports.factions:setFactionPresupuesto(4 , 50)	
        outputChatBox("Usted ha Reparado este Vehiculo", thePlayer, 255, 194, 14 )
  end
end
end
end
addCommandHandler("reparar",repararr) 

function vehicleLights( thePlayer, command, lig1, lig2, lig3 )
if exports.factions:isPlayerInFaction( thePlayer, 4 ) then
  	lig1 = lig1 or math.random( 0, 255 )
  	lig2 = lig2 or math.random( 0, 255 )
  	lig3 = lig3 or math.random( 0, 255 )
	if isPedInVehicle (thePlayer) then
		local vehicle = getPedOccupiedVehicle( thePlayer )
		if ( vehicle ) then
			local driver = getVehicleController ( vehicle )
			if driver then
				if exports.players:takeMoney( thePlayer, 40 ) then
				exports.factions:setFactionPresupuesto(4 , 40)	
				setVehicleOverrideLights (vehicle, 1)
				setVehicleHeadLightColor( vehicle, lig1, lig2, lig3 )
				outputChatBox("Cambiaste El Color de las Luzes de este Auto a: "..lig1..", "..lig2..","..lig3..".",thePlayer, 255, 194, 14,true )			
			end
		end
	end
end
end
end
addCommandHandler("luce",vehicleLights)


function vehicleLights( thePlayer, command, lig1, lig2, lig3 )
if exports.factions:isPlayerInFaction( thePlayer, 4 ) then
  	lig1 = lig1 or math.random( 0, 255 )
  	lig2 = lig2 or math.random( 0, 255 )
  	lig3 = lig3 or math.random( 0, 255 )
	if isPedInVehicle (thePlayer) then
		local vehicle = getPedOccupiedVehicle( thePlayer )
		if ( vehicle ) then
			local driver = getVehicleController ( vehicle )
			if driver then
			if exports.players:takeMoney( thePlayer, 50 ) then
				exports.factions:setFactionPresupuesto(4 , 50)	
				setVehicleOverrideLights (vehicle, 1)
				setVehicleColor( vehicle, lig1, lig2, lig3 )
				outputChatBox("Cambiaste El Color de este Auto a: "..lig1..", "..lig2..","..lig3..".",thePlayer, 255, 194, 14,true )
			end
		end
	end
end
end
end
addCommandHandler("color",vehicleLights)


addEventHandler("onVehicleExit", root, 
function (thePlayer)
	if getElementHealth(source) <= 270 then
		local posible = math.random(1,03)
		if posible == 7 then
			setPedOnFire (thePlayer, true)
		end
	end
end)


function crearObjeto()
mylift = createObject(980,122.49, -161.32, 2.10, 0, 0, 90 )
end
addEventHandler("onResourceStart", getResourceRootElement (getThisResource () ),crearObjeto )

function abrirpuerta(thePlayer)
if exports.factions:isPlayerInFaction( thePlayer, 4 ) then
  moveObject(mylift, 1500, 122.49, -161.32, -2.57, 0, 0, 0 )
  exports.chat:me( thePlayer, "toca un boton en su llave y abre la puerta del Taller." )
end
end
addCommandHandler("mcp",abrirpuerta)

function cerrarpuerta(thePlayer)
if exports.factions:isPlayerInFaction( thePlayer, 4 ) then
  moveObject(mylift,1500,122.49, -161.32, 2.10, 0, 0, 0)
  exports.chat:me( thePlayer, "toca un boton en su llave y cierra la puerta del Taller." )
end
end
addCommandHandler("mcp1",cerrarpuerta)
-------------------------------------------------------------------------------------------------