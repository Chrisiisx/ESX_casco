ESX = nil
local PlayerData = {}
local isMale = false
local isFemale = false
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



RegisterCommand('casco', function(source)

  TriggerEvent('skinchanger:getSkin', function(skin)


    local helmet = skin.helmet_1
    local gender = nil
    if skin.sex == 0 then
      isMale = true
    else
      isMale = false
    end
    if isMale then
      gender = 0
    else
      gender = 1
    end

    if helmet == -1 then
      TriggerEvent('skinchanger:loadSkin', {
        sex = gender,
        helmet_1 = 39,
        helmet_2 = 0,
        exports['mythic_notify']:SendAlert('inform', 'Casco Aggiunto!', 2500, { ['background-color'] = '#00453e', ['color'] = '#ffffff' })
      })
    elseif helmet ~ -1 then
      TriggerEvent('skinchanger:loadSkin', {
        sex = gender,
        helmet_1 = -1,
        exports['mythic_notify']:SendAlert('inform', 'Casco Rimosso!', 2500, { ['background-color'] = '#360400', ['color'] = '#ffffff' })
      })
    end
  
  end)





end)


function notify(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, true)
end