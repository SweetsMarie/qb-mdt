------------------------CREDITS------------------------
--------        Script made by Deltarix        --------
--   Copyright 2021 Deltarix. All rights reserved    --
-------------------------------------------------------

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function Open()
    QBCore.Functions.TriggerCallback('qb-mdt:server:getmdtinfo', function(playerinfo)
        SetNuiFocus(true, true)
        print(playerinfo[1].rank)
        SendNUIMessage({
            drxDispatches = drxDispatches,
            drxWarrants = drxWarrants,
            drxProfiles = playerinfo,
            vrpcharname = playerinfo[1].charname,
            phone_number = playerinfo[1].phone,
            dateofbirth = playerinfo[1].dateofbirth,
            policegroup = playerinfo[1].policegroup,
            badgenumber = playerinfo[1].badgenumber,
            duty = string.upper(playerinfo[1].duty),
            rank = playerinfo[1].rank,
            open = true,
        })
    end)
end
--[[     QBCore.Functions.TriggerCallback('drx_mdt:profiles', function(drxProfiles)
        QBCore.Functions.TriggerCallback('drx_mdt:characterProfiles', function(charProfiles)
            QBCore.Functions.TriggerCallback('drx_mdt:characterInfo', function(playerInfo)
                QBCore.Functions.TriggerCallback('drx_mdt:fetchDispatch', function(drxDispatches)
                    QBCore.Functions.TriggerCallback('drx_mdt:fetchWarrants', function(drxWarrants)
                        SetNuiFocus(true, true)
                        SendNUIMessage({
                            -- users
                            identifier = 'test',
                            vrpcharname = playerInfo[1].firstname.. ' ' ..playerInfo[1].lastname,
                            phonenumber = playerInfo[1].phone,
                            dateofbirth = playerInfo[1].birthdate,
                            -- drx_mdt_dispatch
                            drxDispatches = drxDispatches,
                            -- drx_mdt_warrants
                            drxWarrants = drxWarrants,
                            -- mdt_profiles
                            --drxProfiles = drxProfiles,
                            drxProfiles = charProfiles,
                            -- char profiles
                            identifier = charProfiles[1].identifier,
                            charname = charProfiles[1].charname,
                            policegroup = charProfiles[1].policegroup,
                            rank = charProfiles[1].rank,
                            badgenumber = charProfiles[1].badgenumber,
                            duty = charProfiles[1].duty,
                            image = charProfiles[1].image,
                            open = true,
                        })
                    end)
                end)
            end)
        end)
    end)
end ]]

function Close()
    SetNuiFocus(false, false)
    SendNUIMessage({
        close = true
    })
end