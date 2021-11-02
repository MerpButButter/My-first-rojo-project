local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

local Materials = {"Glass", "Foil", "Glacier", "Brick"}

local function Waterball()
	local Water = Instance.new("Part")

	Water.Name = "Water"
	Water.Shape = Enum.PartType.Ball
	Water.Material = Enum.Material[Materials[math.random(#Materials)]]
	Water.Transparency = 0.4
	Water.Anchored = false
	Water.Reflectance = math.random(10, 20) / 10
	Water.CFrame = CFrame.new(34.928, 3.363, 4.785)
	Water.Size = Vector3.new(
		math.random(10, 20) / 100,
		math.random(300, 400) / 50, 
		math.random(300, 400) / 50
	)
	Water.Color = Color3.fromRGB(
		math.random(30, 40),
		math.random(10, 20),
		math.random(145, 155)
	)
	Water.Parent = workspace

	return Water
end
local function TweenWater(Water, Time)
	local Connection
	local Tween = TweenService:Create(Water, TweenInfo.new(
		Time,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.In
		), {
			Transparency = 1
		}
	)

	Tween:Play()

	Connection = Tween.Completed:Connect(function()
		Debris:AddItem(Water)
		Connection:Disconnect()
	end)
end

for Count = 1, 1000 do task.wait(0.1)
	TweenWater(Waterball(), 3)
end