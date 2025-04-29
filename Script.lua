local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "ScrollUI"
screenGui.ResetOnSpawn = false

-- Khung chính (UI nhỏ)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 250, 0, 200)  -- Thu nhỏ kích thước UI
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
mainFrame.BackgroundTransparency = 0.4
mainFrame.Active = true
mainFrame.Draggable = true

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 10)

-- Tiêu đề
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)  -- Kích thước tiêu đề nhỏ
title.BackgroundTransparency = 1
title.Text = "GENIUS"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- ScrollingFrame chứa nút
local scroll = Instance.new("ScrollingFrame", mainFrame)
scroll.Size = UDim2.new(1, 0, 1, -30)  -- Chiếm phần còn lại
scroll.Position = UDim2.new(0, 0, 0, 30)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)  -- Khoảng cách giữa các nút

-- Hàm tạo nút
local function createButton(text, onClick)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 30)  -- Nút nhỏ hơn
	btn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
	btn.BackgroundTransparency = 0.2
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Gotham
	btn.TextScaled = true
	btn.Text = text
	btn.Parent = scroll

	local btnCorner = Instance.new("UICorner", btn)
	btnCorner.CornerRadius = UDim.new(0, 8)

	btn.MouseButton1Click:Connect(onClick)
end

-- Nút thực thi script
createButton("SkyHub | Arise Crossover", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/SKYLOLAND/refs/heads/main/Load.lua"))()
end)

-- Hàm tạo nút
local function createButton(text, onClick)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 30)  -- Nút nhỏ hơn
	btn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
	btn.BackgroundTransparency = 0.2
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Gotham
	btn.TextScaled = true
	btn.Text = text
	btn.Parent = scroll

	local btnCorner = Instance.new("UICorner", btn)
	btnCorner.CornerRadius = UDim.new(0, 8)

	btn.MouseButton1Click:Connect(onClick)
end

-- Nút thực thi script
createButton("YT", function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
end)

-- Hàm tạo nút
local function createButton(text, onClick)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 30)  -- Nút nhỏ hơn
	btn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
	btn.BackgroundTransparency = 0.2
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Gotham
	btn.TextScaled = true
	btn.Text = text
	btn.Parent = scroll

	local btnCorner = Instance.new("UICorner", btn)
	btnCorner.CornerRadius = UDim.new(0, 8)

	btn.MouseButton1Click:Connect(onClick)
end

-- Nút thực thi script
createButton("Super Happy Magic Forest | UGC", function()
	loadstring(game:HttpGet(('https://pastefy.app/hJs5XmSk/raw'),true))()
end)


-- Nút đóng UI
createButton("Close UI", function()
	mainFrame:Destroy()
end)

-- Nút tăng tốc
createButton("speed up ", function()
	local char = player.Character or player.CharacterAdded:Wait()
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum.WalkSpeed = 50 end
end)

-- Tự động cập nhật chiều dài của Canvas để cuộn
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end)
