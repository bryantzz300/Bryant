--Abaixo estará Lib da nossa Ui

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()

local UI = Lib:Create{
   Theme = "Dark", -- or any other theme
   Size = UDim2.new(0, 555, 0, 400) -- default
}

local Main = UI:Tab{
   Name = "Inicio"
}

local Divider = Main:Divider{
   Name = "Main shit"
}

local QuitDivider = Main:Divider{
   Name = "Sair"
}

-- Script para ser colocado dentro de um LocalScript

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Define a velocidade desejada
local userDefinedSpeed = 30 -- Altere este valor para a velocidade desejada

-- Variável para controlar se o aumento de velocidade está ativo
local speedBoostActive = true

-- Função para aplicar ou remover o aumento de velocidade
local function updateSpeedBoost()
    if speedBoostActive then
        humanoid.WalkSpeed = userDefinedSpeed
    else
        humanoid.WalkSpeed = 16 -- Velocidade padrão do Roblox
    end
end

-- Aplica o aumento de velocidade quando o personagem é adicionado
if character then
    updateSpeedBoost()
end

-- Aplica o aumento de velocidade quando o personagem é reaparecido
player.CharacterAdded:Connect(function(char)
    character = char
    humanoid = character:WaitForChild("Humanoid")
    updateSpeedBoost()
end)

-- Função para alternar o estado do aumento de velocidade
local function toggleSpeedBoost()
    speedBoostActive = not speedBoostActive
    updateSpeedBoost()
end

-- Tecla para ativar e desativar o aumento de velocidade (por exemplo, a tecla "F")
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        toggleSpeedBoost()
    end
end)
