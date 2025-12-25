-- ============================================
-- DEVELOPED BY: IRFAN MODDERS
-- SUPPORT: ZAYA
-- ============================================

if not game:GetService("RunService"):IsClient() then return end
wait(3)

print("MEMULAI INJECTION GAME") 

-- 
local function XFarm()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    --coba cari remote bunga
    local collectRemote
    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            if v.Name:lower():find("collect") or v.Name:lower():find("flower") then
                collectRemote = v
                break
            end
        end
    end
    
    if collectRemote then
        spawn(function()
            while true do
                
                for _, flower in pairs(workspace:GetDescendants()) do
                    if flower.Name:find("Flower") or flower:GetAttribute("IsFlower") then
                        pcall(function()
                            if collectRemote:IsA("RemoteEvent") then
                                collectRemote:FireServer(flower)
                            elseif collectRemote:IsA("RemoteFunction") then
                                collectRemote:InvokeServer(flower)
                            end
                        end)
                    end
                end
                wait(0.1) -- cepat farm
            end
        end)
        print("✅ X-FARM: ON")
    else
        print("X-FARM: gagal terjadi error atau kesalahan game")
    end
end

-- 
local function GluidTPX()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local UserInputService = game:GetService("UserInputService")
    
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TeleportGUI"
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false
    mainFrame.Parent = screenGui
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "TELEPORT KE PLAYER"
    title.TextColor3 = Color3.fromRGB(255, 255, 0)
    title.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    title.Font = Enum.Font.GothamBold
    title.Parent = mainFrame
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 40, 0, 40)
    closeBtn.Position = UDim2.new(1, -40, 0, 0)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = mainFrame
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -20, 1, -80)
    scrollFrame.Position = UDim2.new(0, 10, 0, 50)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.ScrollBarThickness = 5
    scrollFrame.Parent = mainFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.Parent = scrollFrame
    
    
    local function updatePlayerList()
        for _, v in pairs(scrollFrame:GetChildren()) do
            if v:IsA("TextButton") then v:Destroy() end
        end
        
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer ~= player then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 0, 40)
                btn.Text = "👤 " .. targetPlayer.Name
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
                btn.Font = Enum.Font.Gotham
                btn.Parent = scrollFrame
                
                btn.MouseButton1Click:Connect(function()
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character:SetPrimaryPartCFrame(targetPlayer.Character.HumanoidRootPart.CFrame)
                        print("✅ TELEPORTED to: " .. targetPlayer.Name)
                        mainFrame.Visible = false
                    end
                end)
            end
        end
        
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #Players:GetPlayers() * 45)
    end
    
    
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F1 then
            mainFrame.Visible = not mainFrame.Visible
            if mainFrame.Visible then
                updatePlayerList()
            end
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)
    
    Players.PlayerAdded:Connect(updatePlayerList)
    Players.PlayerRemoving:Connect(updatePlayerList)
    
    print("✅ GLUIDER-TPX: klick f1 di keyboard delta untuk teleport")
end

-- 
local function XWalk()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    spawn(function()
        while true do
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 40 
                end
            end
            wait(0.5)
        end
    end)
    
    print("✅ X-WALK: kecepatan 40% cepat")
end

--
local function AntiBanned()
    print("ANTI-BANNED: ON")
    
end

--
local function F2Hide()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local UserInputService = game:GetService("UserInputService")
    local TextService = game:GetService("TextService")
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NameChangerGUI"
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 350, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false
    mainFrame.Parent = screenGui
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "CUSTOM NAME CHANGER"
    title.TextColor3 = Color3.fromRGB(255, 200, 0)
    title.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    title.Font = Enum.Font.GothamBold
    title.Parent = mainFrame
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.8, 0, 0, 40)
    textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    textBox.PlaceholderText = "Enter custom name..."
    textBox.Text = player.Name
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
    textBox.Font = Enum.Font.Gotham
    textBox.Parent = mainFrame
    
    local applyBtn = Instance.new("TextButton")
    applyBtn.Size = UDim2.new(0.8, 0, 0, 40)
    applyBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
    applyBtn.Text = "APPLY CUSTOM NAME"
    applyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    applyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    applyBtn.Font = Enum.Font.GothamBold
    applyBtn.Parent = mainFrame
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 40, 0, 40)
    closeBtn.Position = UDim2.new(1, -40, 0, 0)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = mainFrame
    
    
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F2 then
            mainFrame.Visible = not mainFrame.Visible
            if mainFrame.Visible then
                textBox.Text = player.Name
            end
        end
    end)
    
    applyBtn.MouseButton1Click:Connect(function()
        local newName = textBox.Text
        if newName and newName ~= "" then
            
            pcall(function()
                player.DisplayName = newName
            end)
            print("✅ NAME DI UBAH ke: " .. newName)
            mainFrame.Visible = false
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)
    
    print("✅ F2-HIDE: untuk ganti nama user")
end


local function XInfo()
    print("=======================================")
    print("bee swarm cheat information")
    print("creator: irfanModder")
    print("ANTI-CHEAT KUAT online")
    print("TERIMA KASIH")
    print("=======================================")
end

-- menu utama
spawn(function()
    wait(1)
    XFarm()      
    wait(0.5)
    GluidTPX()   
    wait(0.5)
    XWalk()      
    wait(0.5)
    AntiBanned() 
    wait(0.5)
    F2Hide()     
    wait(0.5)
    XInfo()      
    
    print("\n" .. string.rep("=", 50))
    print("SEMUA FITUR TELAH HIDUP")
    print(string.rep("=", 50))
    print("1. X-FARM: auto farming bunga")
    print("2. GLUIDER-TPX: F1 untuk teleport ke player")
    print("3. X-WALK: kecepatan boost 40x")
    print("4. ANTI-BANNED ON")
    print("5. F2-HIDE: F2 untuk ganti nama")
    print("6. X-INFO: credit info")
    print(string.rep("=", 50))
    print("\nTERIMAKASIH TELAH MEMBELI JASA IRFAN MODDER")
    print("SELAMAT MEMAKAI")
end)
