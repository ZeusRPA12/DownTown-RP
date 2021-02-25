
function crearObjeto2()
mylift = createObject(980,93.51, -201.68, 1.10, 0, 0, 180 )
end
addEventHandler("onResourceStart", getResourceRootElement (getThisResource () ),crearObjeto2 )

function abrirpuerta2(thePlayer)
if exports.factions:isPlayerInFaction( thePlayer, 4 ) then
  moveObject(mylift, 1500, 93.51, -201.68, -2.58, 0, 0, 0 )
  exports.chat:me( thePlayer, "toca un boton en su llave y abre la puerta del Taller." )
end
end
addCommandHandler("mcp2",abrirpuerta2)

function cerrarpuerta2(thePlayer)
if exports.factions:isPlayerInFaction( thePlayer, 4 ) then
  moveObject(mylift,1500,93.51, -201.68, 2.10, 0, 0, 0)
  exports.chat:me( thePlayer, "toca un boton en su llave y cierra la puerta del Taller." )
end
end
addCommandHandler("mcp3",cerrarpuerta2)
