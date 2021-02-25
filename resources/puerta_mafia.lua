
------------------------------------- Mafia-------------------------------------------------
function crearObjeto()
mylift = createObject(16773, -1.9, -267.74, 6.40, 0, 0, 180)
end
addEventHandler("onResourceStart", getResourceRootElement (getThisResource () ),crearObjeto )

function abrirpuerta1(thePlayer)
if exports.factions:isPlayerInFaction( thePlayer, 8 ) then
  moveObject(mylift, 1500, -1.9, -267.74, 0.40, 0, 0, 0 )
  exports.chat:me( thePlayer, "toca un boton en su llave y abre la puerta." )
end
end
addCommandHandler("hp",abrirpuerta1)

function cerrarpuerta1(thePlayer)
if exports.factions:isPlayerInFaction( thePlayer, 8 ) then
  moveObject(mylift,3000, -1.9, -267.74, 6.40, 0, 0, 0)
  exports.chat:me( thePlayer, "toca un boton en su llave y cierra la puerta." )
end
end
addCommandHandler("hp2",cerrarpuerta1)

