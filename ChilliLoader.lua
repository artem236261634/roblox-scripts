-- ChilliLoader.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

-- Основные настройки
local correctKey = "123456" -- Пример ключа. Замените на свой уникальный ключ.

-- Функция для проверки ключа
local function checkKey(inputKey)
    return inputKey == correctKey
end

-- Создание GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Введите ключ для активации"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 20
titleLabel.Font = Enum.Font.Gotham
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = frame

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0, 300, 0, 50)
inputBox.Position = UDim2.new(0.5, -150, 0, 75)
inputBox.PlaceholderText = "Введите ключ..."
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
inputBox.ClearTextOnFocus = false
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 18
inputBox.Parent = frame

local confirmButton = Instance.new("TextButton")
confirmButton.Size = UDim2.new(0, 300, 0, 50)
confirmButton.Position = UDim2.new(0.5, -150, 0, 150)
confirmButton.Text = "Подтвердить"
confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
confirmButton.Font = Enum.Font.Gotham
confirmButton.TextSize = 20
confirmButton.Parent = frame

-- Логика кнопки
confirmButton.MouseButton1Click:Connect(function()
    local inputKey = inputBox.Text

    if checkKey(inputKey) then
        -- Если ключ правильный, загружаем основной скрипт
        print("Ключ верный! Загружаем скрипт...")

        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
        end)

        -- Если произошла ошибка, выводим её
        if not success then
            warn("Ошибка при загрузке скрипта: " .. result)
        end

        -- Закрываем GUI после загрузки
        screenGui:Destroy()

    else
        -- Если ключ неверный, выводим сообщение об ошибке
        print("Неверный ключ!")
        -- Можно добавить текстовое уведомление или визуальную ошибку
    end
end)
