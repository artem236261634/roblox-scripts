-- ChilliLoader.lua (проверка ключа и загрузка основного скрипта)

-- Устанавливаем правильный ключ
local correctKey = "123456" -- Ты можешь поменять его на свой уникальный ключ

-- Функция для проверки ключа
local function checkKey(inputKey)
    if inputKey == correctKey then
        return true
    else
        return false
    end
end

-- Просим пользователя ввести ключ (можно заменить на графическое окно для Roblox)
print("Введите ключ для активации:")

-- Получаем ключ от игрока
local inputKey = io.read()  -- В обычных случаях можно использовать GUI для ввода

-- Проверка ключа
if checkKey(inputKey) then
    print("Ключ верный! Загружаем скрипт...")

    -- Загружаем и выполняем основной скрипт с GitHub
    local success, result = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    end)

    -- Если произошла ошибка, выводим её
    if not success then
        warn("Ошибка при загрузке скрипта: " .. result)
    end
else
    print("Неверный ключ!")
end
