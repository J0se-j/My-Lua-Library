-- UI Library Core
local Library = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "AmethystUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 480, 0, 300)
MainFrame.BackgroundColor3 = Color3.fromRGB(120, 82, 182)
MainFrame.BackgroundTransparency = 0.18
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame:TweenSize(UDim2.new(0, 480, 0, 300), "Out", "Bounce", 0.4)

-- Rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Hamburger Menu
local Hamburger = Instance.new("TextButton")
Hamburger.Text = "☰"
Hamburger.Font = Enum.Font.GothamBold
Hamburger.TextSize = 20
Hamburger.Size = UDim2.new(0, 40, 0, 40)
Hamburger.Position = UDim2.new(0, 10, 0, 10)
Hamburger.BackgroundColor3 = Color3.fromRGB(100, 60, 170)
Hamburger.TextColor3 = Color3.new(1,1,1)
Hamburger.Parent = MainFrame

local TabsFrame = Instance.new("Frame")
TabsFrame.Size = UDim2.new(0, 120, 1, -20)
TabsFrame.Position = UDim2.new(0, 0, 0, 60)
TabsFrame.BackgroundColor3 = Color3.fromRGB(90, 50, 150)
TabsFrame.Parent = MainFrame

local isOpen = true
Hamburger.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	TabsFrame.Visible = isOpen
end)

-- Minimize Button
local Minimize = Instance.new("TextButton")
Minimize.Text = "-"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 20
Minimize.Size = UDim2.new(0, 40, 0, 40)
Minimize.Position = UDim2.new(1, -50, 0, 10)
Minimize.BackgroundColor3 = Color3.fromRGB(100, 60, 170)
Minimize.TextColor3 = Color3.new(1,1,1)
Minimize.Parent = MainFrame

local ShowButton = Instance.new("TextButton")
ShowButton.Text = "Show Script"
ShowButton.Size = UDim2.new(0, 120, 0, 40)
ShowButton.Position = UDim2.new(0.5, -60, 0.5, 160)
ShowButton.BackgroundColor3 = Color3.fromRGB(120, 82, 182)
ShowButton.TextColor3 = Color3.new(1,1,1)
ShowButton.Visible = false
ShowButton.Draggable = true
ShowButton.Parent = ScreenGui

local corner = Instance.new("UICorner", ShowButton)
corner.CornerRadius = UDim.new(0, 12)

Minimize.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	ShowButton.Visible = true
end)

ShowButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	ShowButton.Visible = false
end)

-- Library Methods
function Library:CreateWindow(config)
	MainFrame.Visible = true
	return Library
end

function Library:CreateTab(name, icon)
	local tab = Instance.new("TextButton")
	tab.Text = name
	tab.Size = UDim2.new(1, 0, 0, 40)
	tab.BackgroundColor3 = Color3.fromRGB(100, 60, 170)
	tab.TextColor3 = Color3.new(1,1,1)
	tab.Parent = TabsFrame
	local corner = Instance.new("UICorner", tab)
	corner.CornerRadius = UDim.new(0, 12)

	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, -130, 1, -60)
	container.Position = UDim2.new(0, 130, 0, 60)
	container.BackgroundColor3 = Color3.fromRGB(140, 100, 200)
	container.Visible = false
	container.Parent = MainFrame
	Instance.new("UICorner", container).CornerRadius = UDim.new(0, 12)

	tab.MouseButton1Click:Connect(function()
		for _, child in ipairs(MainFrame:GetChildren()) do
			if child:IsA("Frame") and child ~= TabsFrame then
				child.Visible = false
			end
		end
		container.Visible = true
	end)

	return {
		CreateSection = function(_, title)
			local section = Instance.new("TextLabel")
			section.Text = title
			section.Font = Enum.Font.GothamBold
			section.TextColor3 = Color3.new(1,1,1)
			section.TextSize = 16
			section.BackgroundTransparency = 1
			section.Size = UDim2.new(1, -20, 0, 30)
			section.Position = UDim2.new(0, 10, 0, 10)
			section.Parent = container
			return {
				CreateButton = function(_, text, callback)
					local btn = Instance.new("TextButton")
					btn.Text = text
					btn.Size = UDim2.new(0, 200, 0, 40)
					btn.Position = UDim2.new(0, 10, 0, 50)
					btn.BackgroundColor3 = Color3.fromRGB(160, 120, 220)
					btn.TextColor3 = Color3.new(1,1,1)
					btn.Parent = container
					Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
					btn.MouseButton1Click:Connect(callback)
				end,
				CreateSlider = function(_, min, max, callback)
					local slider = Instance.new("TextButton")
					slider.Text = "Slider"
					slider.Size = UDim2.new(0, 200, 0, 40)
					slider.Position = UDim2.new(0, 10, 0, 100)
					slider.BackgroundColor3 = Color3.fromRGB(180, 130, 230)
					slider.TextColor3 = Color3.new(1,1,1)
					slider.Parent = container
					Instance.new("UICorner", slider).CornerRadius = UDim.new(0, 8)
					-- You can add dragging logic here later
				end
			}
		end
	}
end

function Library:Destroy()
	ScreenGui:Destroy()
end

return Library
