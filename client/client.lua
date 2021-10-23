RegisterCommand(veh, function(sourec, args, rawCommand)

     local vehicle = args[1]
     local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoord(PlayerPedId(), 0.0, 2.0, 0.5))
     vehiclehash = GetHashKey(vehicle)
     RequestModel(vehiclehash)

     Citizen.CreateThread(function()

         while not HashModelLoader(vehicle)
            Citizen.Wait(10)
        end
           
        local spawnedVehicle = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(+90, 1, 0))
        SetVehicleNumberPlateText(spawnedVehicle, "Spawned Car")  --You can Edit this--
        Notify("~r~Fahrzeug wurde erstellt und gespawnt")


    end)
end)   

function Notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(msg)
    DrawNotification(false, false)
end