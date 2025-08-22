-- ChilliLoader.lua
local HttpService = game:GetService("HttpService")

-- URL скрипта, который будет загружаться
local scriptUrl = "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"

-- Попробуем получить и выполнить скрипт с указанного URL
local success, result = pcall(function()
    -- Получаем код с GitHub
    local scriptContent = game:HttpGet(scriptUrl)

    -- Выполняем полученный код
    loadstring(scriptContent)()
end)

-- Если произошла ошибка при загрузке, выводим сообщение об ошибке
if not success then
    warn("Ошибка при загрузке скрипта: " .. result)
    -- Здесь можно добавить дополнительные действия, например, отобразить ошибку в интерфейсе
end