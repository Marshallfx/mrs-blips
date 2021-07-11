ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local display = false

local swencykiy = {
  [1] = {x = 1693.45667, y = 4823.17725, z = 42.1631294, kiyafetciid = 1, info = 'kiyafetci 1'},
  [2] = {x = -1177.865234375, y = -1780.5612792969, z = 3.9084651470184, kiyafetciid = 2, info = 'kiyafetci 2'},
  [3] = {x = 299.29, y = -598.45, z = 43.29, kiyafetciid = 3, info = 'kiyafetci 3'},
  [4] = {x = -712.215881, y = -155.352982, z = 37.4151268, kiyafetciid = 4, info = 'kiyafetci 4'},
  [5] = {x = 123.779823, y = -301.616455, z = 54.557827, kiyafetciid = 5, info = 'kiyafetci 5'},
  [6] = {x = 121.76, y = -224.6, z = 53.56, kiyafetciid = 6, info = 'kiyafetci 6'},
  [7] = {x = -1192.94495, y = -772.688965, z = 17.3255997, kiyafetciid = 7, info = 'kiyafetci 7'},  
  [8] = {x = 454.75, y = -991.05, z = 30.69, kiyafetciid = 8, info = 'kiyafetci 8'},
  [9] = {x = 425.236, y = -806.008, z = 28.491, kiyafetciid = 9, info = 'kiyafetci 9'},
  [10] = {x = -162.658, y = -303.397, z = 38.733, kiyafetciid = 10, info = 'kiyafetci 10'},
  [11] = {x = 75.950, y = -1392.891, z = 28.376, kiyafetciid = 11, info = 'kiyafetci 11'},
  [12] = {x = -822.194, y = -1074.134, z = 10.328, kiyafetciid = 12, info = 'kiyafetci 12'}, 
  [13] = {x = -1450.711, y = -236.83, z = 48.809, kiyafetciid = 13, info = 'kiyafetci 13'},
  [14] = {x = 4.254, y = 6512.813, z = 30.877, kiyafetciid = 14, info = 'kiyafetci 14'},
  [15] = {x = 615.180, y = 2762.933, z = 41.088, kiyafetciid = 15, info = 'kiyafetci 15'},
  [16] = {x = 1196.785, y = 2709.558, z = 37.222, kiyafetciid = 16, info = 'kiyafetci 16'},
  [17] = {x = -3171.453, y = 1043.857, z = 19.863, kiyafetciid = 17, info = 'kiyafetci 17'},
  [18] = {x = -1100.959, y = 2710.211, z = 18.107, kiyafetciid = 18, info = 'kiyafetci 18'},
  [19] = {x = -1207.6564941406, y = -1456.8890380859, z = 4.3784737586975, kiyafetciid = 19, info = 'kiyafetci 19'},
  [20] = {x = 1784.13, y = 2492.6, z = 50.43, kiyafetciid = 20, info = 'kiyafetci 20'},
  [21] = {x = 198.4602355957, y = -1646.7690429688, z = 29.803218841553, kiyafetciid = 21, info = 'kiyafetci 21'}
}


RegisterCommand("blips", function(source, args)
    SetDisplay(not display)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

function blipolustur(x, y, sprite, colour, scale, text)
  local blip = AddBlipForCoord(x, y)
  SetBlipSprite(blip, sprite)
  SetBlipColour(blip, colour)
  SetBlipAsShortRange(blip, true)
  SetBlipScale(blip, scale)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(text)
  EndTextCommandSetBlipName(blip)
  table.insert(blipshs, blip)
end

blipshs = {}

RegisterNUICallback("kiyafetac", function(data)
  for k, v in pairs(swencykiy) do
    blipolustur(v.x,v.y, 475, 0, 0.5, 'Kiyafetçi')
  end
end)


RegisterNUICallback("kiyafetkapat", function(data)
  for k, v in pairs(blipshs) do
    RemoveBlip(v)
  end
end)

RegisterNUICallback('close', function()
  SetNuiFocus(false, false)
end)

