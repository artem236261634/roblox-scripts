-- ChilliLoader.lua
local HttpService = game:GetService("HttpService")

-- URL основного скрипта, который будет загружаться
local scriptUrl = "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua" -- Ссылка на твой основной скрипт

-- Функция для проверки ключа
local function checkKey(inputKey)
    local validKey = "123456" -- Пример ключа. Замените на свой уникальный ключ

    if inputKey == validKey then
        return true
    else
        return false
    end
end

-- Запрос на ввод ключа (можно сделать GUI или просто запрос в консоль)
print("Введите ключ для активации:")
local inputKey = io.read() -- Чтение ключа (для консольных скриптов)

if checkKey(inputKey) then
    print("Ключ верный! Загружаю скрипт...")
    
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
    end
else
    print("Неверный ключ!")
end
