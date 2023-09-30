local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt"))()

local win = lib:Window("PREVIEW",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Farm")
local tab2 = win:Tab("Teleports")
local tab3 = win:Tab("Misc")
local tab4 = win:Tab("Credits")


tab:Toggle("AutoTab",false, function(bool)
getgenv().AutoTab = bool;
while true do
if getgenv().AutoTab == true then
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DamageIncreaseOnClickEvent"):FireServer()
end
task.wait(0.01)
end
end)

tab:Toggle("AutoUnlockGloves", false, function(bool)
    getgenv().AutoUnlock = bool
    if getgenv().AutoUnlock then
        local GlovesRequirements = {
            Basic = { min = 0, max = 199 },
            Wood = { min = 200, max = 1499 },
            Iron = { min = 1500, max = 7999 },
            Gold = { min = 8000, max = 29999 },
            Emerald = { min = 30000, max = 99999 },
            Spike = { min = 100000, max = 349999 },
            Pyramid = { min = 350000, max = 1099999 },
            Spiky = { min = 1100000, max = 1899999 },
            Palm = { min = 1900000, max = 3099999 },
            Desert = { min = 3100000, max = 18999999 },
            Rock = { min = 19000000, max = 61999999 },
            GoldRock = { min = 62000000, max = 109999999 },
            Crystal = { min = 110000000, max = 189999999 },
            GreenCrystal = { min = 190000000, max = 309999999 },
            Obsidian = { min = 3100000000, max = 2199999999 },
            DriedOcean = { min = 2200000000, max = 74999999999 },
            Island = { min = 75000000000, max = 12999999999 },
            Ocean = { min = 13000000000, max = 21999999999 },
            SunkenShip = { min = 22000000000, max = 36999999999 },
            Octopus = { min = 37000000000, max = 369999999999 },
            Pepermint = { min = 370000000000, max = 1199999999999 },
            CandyCane = { min = 1200000000000, max = 2199999999999 },
            PinkSweet = { min = 2200000000000, max = 3699999999999 },
            Chocolate = { min = 3700000000000, max = 6099999999999 },
            Candy = { min = 6100000000000, max = 75999999999999 },
            Snowy = { min = 76000000000000, max = 249999999999999 },
            Santa = { min = 250000000000000, max = 459999999999999 },
            IceSpike = { min = 460000000000000, max = 759999999999999 },
            Ice = { min = 760000000000000, max = 1299999999999999 },
            Snowman = { min = 1300000000000000, max = 5399999999999999 },
            ToyBlock = { min = 5400000000000000, max = 17999999999999999 },
            ToyShape = { min = 18000000000000000, max = 32999999999999999 },
            ToyCar = { min = 33000000000000000, max = 53999999999999999 },
            Teapot = { min = 54000000000000000, max = 90999999999999999 },
            TeddyBear = { min = 91000000000000000, max = 329999999999999999 },
            Cow = { min = 330000000000000000, max = 1099999999999999999 },
            Pig = { min = 1100000000000000000, max = 1999999999999999999 },
            Apple = { min = 2000000000000000000, max = 3299999999999999999 },
            Carrot = { min = 3300000000000000000, max = 5499999999999999999 },
            Chicken = { min = 5500000000000000000, max = 13999999999999999999 },
            Leafy = { min = 14000000000000000000, max = 46999999999999999999 },
            Bamboo = { min = 47000000000000000000, max = 84999999999999999999 },
            Ninja = { min = 85000000000000000000, max = 139999999999999999999 },
            Sakura = { min = 140000000000000000000, max = 239999999999999999999 },
            Kitsune = { min = 240000000000000000000, max = 779999999999999999999 },
            Moon = { min = 780000000000000000000, max = 2599999999999999999999 },
            Rocket = { min = 2600000000000000000000, max = 4699999999999999999999 },
            Space = { min = 4700000000000000000000, max = 7799999999999999999999 },
            UFO = { min = 7800000000000000000000, max = 12999999999999999999999 },
            Alien = { min = 13000000000000000000000, max = 53999999999999999999999 },
            MagicalGloves = { min = 54000000000000000000000, max = 179999999999999999999999 },
            SoulLeafGloves = { min = 180000000000000000000000, max = 319999999999999999999999 },
            ShroomyGloves = { min = 320000000000000000000000, max = 539999999999999999999999 },
            OverGrownGloves = { min = 540000000000000000000000, max = 899999999999999999999999 },
            MagicalLotusGloves = { min = 900000000000000000000000, max = 3299999999999999999999 },
            Heaven = { min = 3300000000000000000000, max = 10999999999999999999999 },
            SpikyHeaven = { min = 11000000000000000000000, max = 19999999999999999999999 },
            HeavenCloud = { min = 20000000000000000000000, max = 32999999999999999999999 },
            AngelRock = { min = 33000000000000000000000, max = 53999999999999999999999 },
            Angel = { min = 54000000000000000000000, max = math.huge },
        }

        local player = game.Players.LocalPlayer
        local damageStat = player.leaderstats.Damage

        local function UnlockGlove(glove)
            local args = {
                [1] = glove
            }
            game:GetService("ReplicatedStorage").Events.ClickedGlovesButton:FireServer(unpack(args))
        end

        local function GetCurrentGlove()
            for glove, requirement in pairs(GlovesRequirements) do
                if damageStat.Value >= requirement.min and damageStat.Value <= requirement.max then
                    return glove
                end
            end
            return nil
        end

        local function UnlockNextGlove()
            local currentGlove = GetCurrentGlove()
            if currentGlove then
                UnlockGlove(currentGlove)
            else
                for glove, requirement in pairs(GlovesRequirements) do
                    if damageStat.Value >= requirement.min and damageStat.Value <= requirement.max then
                        UnlockGlove(glove)
                        break
                    end
                end
            end
        end

        while true do
            UnlockNextGlove()
            wait(15)
        end
    end
end)


tab:Toggle("AutoAscend", false, function(bool)
    getgenv().AutoAscend = bool
    while getgenv().AutoAscend do
        task.wait(0.55)

        local function convertRequiredDamage(requiredDamage)
            local num = tonumber(string.match(requiredDamage, "%d+"))

            if string.find(requiredDamage, "M") then
                num = num * 1000000
            elseif string.find(requiredDamage, "B") then
                num = num * 1000000000
            elseif string.find(requiredDamage, "T") then
                num = num * 1000000000000
            elseif string.find(requiredDamage, "Qa") then
                num = num * 1000000000000000
            elseif string.find(requiredDamage, "Qi") then
                num = num * 1000000000000000000
            elseif string.find(requiredDamage, "Sx") then 
                num = num * 1000000000000000000000
            elseif string.find(requiredDamage, "Sp") then 
                num = num * 1000000000000000000000000
            end

            return num
        end

        local function removeHTMLTags(text)
            return text:gsub("<[^>]+>", "")
        end

        local player = game.Players.LocalPlayer
        local currentDamage = player.leaderstats.Damage.Value

        local requiredDamageTextLabel = player.PlayerGui.AscendUI.Frame.RequiredDamage
        local requiredDamageText = requiredDamageTextLabel.Text
        local cleanedText = removeHTMLTags(requiredDamageText)

        local requiredDamage = string.match(cleanedText, "(%d+[%a]*)")
        local requiredDamageNumber = convertRequiredDamage(requiredDamage)

        if requiredDamageNumber and currentDamage >= requiredDamageNumber then
            local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(unpack(args))
        end
    end
end)

tab:Toggle("AutoBuyGemShop", false, function(bool)
    getgenv().AutoBuyGemShop = bool
    while getgenv().AutoBuyGemShop do
        task.wait(5)
        
        local Options = { "CoinBoost", "GemBoost", "ScrewCopperBoldBoost", "EggLuck", "TankSpeed", "CoinCollectionRange" }
        
        local GemsInUi = tonumber(game.Players.LocalPlayer.PlayerGui.MainUi.Top.Gems.TextLabel.Text)
        
        for _, option in ipairs(Options) do
            local GemCost = tonumber(game.Players.LocalPlayer.PlayerGui.GemShop.Frame.Gemshopgridlayout[option].GemButton.GemAmount.Text)
            
            if GemsInUi >= GemCost then
                local args = {
                    [1] = "Purchase",
                    [2] = option
                }
                
                game:GetService("ReplicatedStorage").Events.GemStoreEvent:InvokeServer(unpack(args))
            end
        end
    end
end)

tab:Toggle("AutoEquipBestPet", false, function(bool)
    getgenv().AutoEquipBestPet = bool
    while getgenv().AutoEquipBestPet do
        game:GetService("ReplicatedStorage").Events.EquipBest:InvokeServer()
        task.wait(10)
    end
end)

local Baby = game.ReplicatedStorage.TeleportLocations:GetChildren()
local options = {}

for i = 1, #Baby do
    local cframe = Baby[i].CFrame
    options[i] = Baby[i].Name 
end

local function teleportToCFrame(index)
    if Baby[index] then
        local cframe = Baby[index].CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        print("Teleported to: " .. tostring(cframe))
    else
        print("Error")
    end
end

tab2:Dropdown("Teleport", options, function(index)
    teleportToCFrame(index)
end)

tab3:Toggle("AutoClaim TimeRewards", false, function(bool)
    getgenv().AutoClaimTimeRewards = bool
    while true do
        if getgenv().AutoClaimTimeRewards == true then
            task.wait(150)
    
            for i = 1, 20 do
                local args = {
                    [1] = i,
                    [2] = false
                }
    
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UpdateSeasonPass"):FireServer(unpack(args))
            end
        end
    end
end)

tab3:Button("Claim DailyReward", function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimDailyReward"):FireServer()
end)

tab3:Button("SpinWheel", function()
    local baby = game.Players.LocalPlayer.PlayerGui.SpinWheel.Frame.SpinButton.TextLabel

    if baby.Text == "Spin" then
        local args = {
            [1] = "Spin"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SpinWheelEvent"):FireServer(unpack(args))

        local args2 = {
            [1] = "SpinComplete"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SpinWheelEvent"):FireServer(unpack(args2))
    end
end)

tab3:Toggle("AutoClaimTask",false, function(bool)
getgenv().AutoClaimTasks = bool;
while true do
if getgenv().AutoClaimTasks == true then
task.wait(5)
local args = {
    [1] = "Claim"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("QuestEvent"):InvokeServer(unpack(args))
end
end
end)

tab4:Label("Credits To:")
tab4:Label("alan11ago#8475")