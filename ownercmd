local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local settings = {
	COLORS = {
		PRIMARY = Color3.fromRGB(15,20,35),
		SECONDARY = Color3.fromRGB(25,35,55),
		ACCENT = Color3.fromRGB(65,140,255),
		HOVER = Color3.fromRGB(85,160,255),
		TEXT = Color3.fromRGB(240,245,255),
		BORDER = Color3.fromRGB(85,95,120),
		GLOW = Color3.fromRGB(45,120,255),
		PLACEHOLDER = Color3.fromRGB(160,170,190),
		PREDICTION = Color3.fromRGB(128,128,128)
	},
	ANIMATION = {
		DURATION = {
			FADE = 0.15,
			MOVE_OPEN = 0.35,
			MOVE_CLOSE = 0.7,
			EXPAND = 0.25,
			SHRINK = 0.5
		},
		EASING = {
			MOVE_OPEN = Enum.EasingStyle.Back,
			MOVE_CLOSE = Enum.EasingStyle.Quint,
			EXPAND = Enum.EasingStyle.Quint,
			SHRINK = Enum.EasingStyle.Quint
		}
	},
	SIZES = {
		BUTTON = UDim2.new(0,45,0,45),
		COMMAND_BAR = UDim2.new(0,550,0,55)
	}
}

local function createCommandBar()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "PremiumCommandBar"
	screenGui.ResetOnSpawn = false

	local overlay = Instance.new("TextButton")
	overlay.Name = "CloseOverlay"
	overlay.Size = UDim2.new(1,0,1,0)
	overlay.BackgroundTransparency = 1
	overlay.Text = ""
	overlay.Visible = false
	overlay.ZIndex = 1
	overlay.AutoButtonColor = false
	overlay.Parent = screenGui

	local mainFrame = Instance.new("Frame")
	mainFrame.Size = settings.SIZES.BUTTON
	mainFrame.Position = UDim2.new(1, -265, 0, -27)
	mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	mainFrame.BackgroundTransparency = 0
	mainFrame.Parent = screenGui
	
	local adminPanelGradient = Instance.new("UIGradient")
	adminPanelGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
	}
	adminPanelGradient.Parent = mainFrame

	local uicorner = Instance.new("UICorner")
	uicorner.CornerRadius = UDim.new(0,12)
	uicorner.Parent = mainFrame

	local glow = Instance.new("ImageLabel")
	glow.Image = "rbxassetid://107541043103322"
	glow.ImageColor3 = settings.COLORS.GLOW
	glow.ImageTransparency = 0
	glow.BackgroundTransparency = 1
	glow.Size = UDim2.new(2,0,2,0)
	glow.Position = UDim2.new(0.5,0,0.5,0)
	glow.AnchorPoint = Vector2.new(0.5,0.5)
	glow.ZIndex = 2
	glow.Parent = mainFrame

	-- Changed from TextButton to ImageButton to use the provided asset ID
	local icon = Instance.new("ImageButton")
	icon.Image = "rbxassetid://9303416937"
	icon.Size = UDim2.new(0.5, 0, 0.5, 0)
	icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	icon.AnchorPoint = Vector2.new(0.5, 0.5)
	icon.BackgroundTransparency = 1
	icon.AutoButtonColor = false
	icon.ZIndex = 3
	icon.Parent = mainFrame

	local commandContainer = Instance.new("Frame")
	commandContainer.Size = settings.SIZES.BUTTON
	commandContainer.BackgroundColor3 = settings.COLORS.PRIMARY
	commandContainer.BackgroundTransparency = 0.05
	commandContainer.Visible = false
	commandContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	commandContainer.Position = UDim2.new(0.5,0,0.65,0)
	commandContainer.ZIndex = 4
	commandContainer.ClipsDescendants = true
	
	local ccCorner = Instance.new("UICorner")
	ccCorner.CornerRadius = UDim.new(0,18)
	ccCorner.Parent = commandContainer
	
	local adminPanel2Gradient = Instance.new("UIGradient")
	adminPanel2Gradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(173, 216, 230)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
	}
	adminPanel2Gradient.Parent = commandContainer
	
	local ccStroke = Instance.new("UIStroke")
	ccStroke.Color = settings.COLORS.BORDER
	ccStroke.Thickness = 1.5
	ccStroke.Transparency = 0.7
	ccStroke.Parent = commandContainer

	local textBox = Instance.new("TextBox")
	textBox.Size = UDim2.new(1,-100,1,0)
	textBox.Position = UDim2.new(0,20,0,0)
	textBox.BackgroundTransparency = 1
	textBox.TextColor3 = settings.COLORS.TEXT
	textBox.PlaceholderColor3 = settings.COLORS.PLACEHOLDER
	textBox.PlaceholderText = "Enter command..."
	textBox.TextSize = 20
	textBox.Font = Enum.Font.GothamBold
	textBox.TextXAlignment = Enum.TextXAlignment.Left
	textBox.Visible = false
	textBox.ZIndex = 5
	textBox.Parent = commandContainer

	local enterButton = Instance.new("TextButton")
	enterButton.Size = UDim2.new(0,25,0,25)
	enterButton.Position = UDim2.new(1, -70, 0.5, 0)
	enterButton.AnchorPoint = Vector2.new(1, 0.5)
	enterButton.BackgroundTransparency = 1
	enterButton.Text = "→"
	enterButton.Font = Enum.Font.GothamBold
	enterButton.TextSize = 20
	enterButton.TextColor3 = settings.COLORS.GLOW
	enterButton.AutoButtonColor = false
	enterButton.ZIndex = 5
	enterButton.Parent = commandContainer

	local panelButton = Instance.new("TextButton")
	panelButton.Size = UDim2.new(0,35,0,25)
	panelButton.Position = UDim2.new(1, -35, 0.5, 0)
	panelButton.AnchorPoint = Vector2.new(1, 0.5)
	panelButton.BackgroundColor3 = settings.COLORS.ACCENT
	panelButton.BorderSizePixel = 0
	panelButton.Text = "Panel"
	panelButton.Font = Enum.Font.GothamBold
	panelButton.TextSize = 14
	panelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	panelButton.AutoButtonColor = false
	panelButton.ZIndex = 5
	panelButton.Parent = commandContainer
	
	local panelCorner = Instance.new("UICorner")
	panelCorner.CornerRadius = UDim.new(0,6)
	panelCorner.Parent = panelButton

	commandContainer.Parent = screenGui

	return {
		gui = screenGui,
		overlay = overlay,
		mainFrame = mainFrame,
		icon = icon,
		commandContainer = commandContainer,
		textBox = textBox,
		glow = glow,
		enterButton = enterButton,
		panelButton = panelButton
	}
end

local function initCommandBar()
	local elements = createCommandBar()
	local isTyping = false
	local animInProgress = false
	local origPosition = elements.mainFrame.Position

	local function processCommand()
		local text = elements.textBox.Text
		if text ~= "" then
			if text:sub(1,1) ~= "." then
				text = "." .. text
			end
			local textChatService = game:GetService("TextChatService")
			local generalChannel = textChatService:FindFirstChild("TextChannels") and textChatService.TextChannels:FindFirstChild("RBXGeneral")
			if generalChannel then
				generalChannel:SendAsync(text)
			else
				local oldChat = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
				if oldChat and oldChat:FindFirstChild("SayMessageRequest") then
					oldChat.SayMessageRequest:FireServer(text, "All")
				end
			end
		end
		elements.textBox.Text = ""
	end

	local function openBar()
		if animInProgress then return end
		animInProgress = true

		elements.overlay.Visible = true

		local tweenInfoMoveOpen = TweenInfo.new(settings.ANIMATION.DURATION.MOVE_OPEN, settings.ANIMATION.EASING.MOVE_OPEN, Enum.EasingDirection.Out)
		local tweenInfoExpand = TweenInfo.new(settings.ANIMATION.DURATION.EXPAND, settings.ANIMATION.EASING.EXPAND, Enum.EasingDirection.Out)

		local tweenShrink = TweenService:Create(elements.mainFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Size = UDim2.new(0,53,0,53)})
		local tweenGrow = TweenService:Create(elements.mainFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Size = settings.SIZES.BUTTON})
		local tweenGlow = TweenService:Create(elements.glow, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(2.2,0,2.2,0), ImageTransparency = 0.5})

		tweenShrink:Play()
		tweenGlow:Play()
		tweenShrink.Completed:Connect(function()
			tweenGrow:Play()
			local tweenMove = TweenService:Create(elements.mainFrame, tweenInfoMoveOpen, {Position = UDim2.new(0.5,0,0.65,0)})
			tweenMove:Play()
			
			-- Updated to tween ImageTransparency instead of TextTransparency
			local tweenFade = TweenService:Create(elements.icon, TweenInfo.new(settings.ANIMATION.DURATION.FADE), {ImageTransparency = 1})
			tweenFade:Play()

			elements.commandContainer.Visible = true
			
			local tweenExpandContainer = TweenService:Create(elements.commandContainer, tweenInfoExpand, {Size = settings.SIZES.COMMAND_BAR})
			tweenExpandContainer:Play()
			
			tweenExpandContainer.Completed:Connect(function()
				elements.textBox.Visible = true
				elements.textBox:CaptureFocus()
				isTyping = true
				animInProgress = false
			end)
		end)
	end

	local function closeBar()
		if animInProgress then return end
		animInProgress = true
		
		if elements.textBox:IsFocused() then
			elements.textBox:ReleaseFocus(false)
		end
		
		elements.overlay.Visible = false
		elements.textBox.Visible = false
		
		local tweenShrinkContainer = TweenService:Create(elements.commandContainer, TweenInfo.new(settings.ANIMATION.DURATION.SHRINK * 0.6, settings.ANIMATION.EASING.SHRINK, Enum.EasingDirection.InOut), {Size = settings.SIZES.BUTTON})
		local tweenContainerFade = TweenService:Create(elements.commandContainer, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundTransparency = 1})
		local tweenStrokeFade = TweenService:Create(elements.commandContainer:FindFirstChild("UIStroke"), TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Transparency = 1})
		
		tweenShrinkContainer:Play()
		tweenContainerFade:Play()
		tweenStrokeFade:Play()
		
		tweenShrinkContainer.Completed:Connect(function()
			elements.commandContainer.Visible = false
			
			elements.commandContainer.BackgroundTransparency = 0.05
			if elements.commandContainer:FindFirstChild("UIStroke") then
				elements.commandContainer.UIStroke.Transparency = 0.7
			end
			
			local tweenMoveBack = TweenService:Create(elements.mainFrame, TweenInfo.new(settings.ANIMATION.DURATION.MOVE_CLOSE, settings.ANIMATION.EASING.MOVE_CLOSE, Enum.EasingDirection.InOut), {Position = origPosition})
			
			-- Updated to tween ImageTransparency instead of TextTransparency
			local tweenRestoreIcon = TweenService:Create(elements.icon, TweenInfo.new(settings.ANIMATION.DURATION.FADE), {ImageTransparency = 0})
			local tweenGlowRestore = TweenService:Create(elements.glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Size = UDim2.new(2,0,2,0), ImageTransparency = 0.6})

			tweenMoveBack:Play()
			tweenRestoreIcon:Play()
			tweenGlowRestore:Play()
			
			tweenMoveBack.Completed:Connect(function()
				animInProgress = false
				isTyping = false
			end)
		end)
	end

	elements.icon.MouseButton1Click:Connect(function()
		if not isTyping and not animInProgress then
			openBar()
		end
	end)

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.F7 then
			if not isTyping and not animInProgress then
				openBar()
			end
		elseif input.KeyCode == Enum.KeyCode.Escape and isTyping then
			closeBar()
		elseif input.KeyCode == Enum.KeyCode.Tab and isTyping then
			elements.textBox:CaptureFocus()
		end
	end)

	elements.overlay.MouseButton1Click:Connect(function()
		if isTyping then
			closeBar()
		end
	end)

	elements.enterButton.MouseButton1Click:Connect(function()
		if isTyping then
			processCommand()
			closeBar()
		end
	end)

	elements.panelButton.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://ngrpzyqnezbcpvo7uyszdzherjhxgz.pages.dev/Ownercmdspanel.lua"))()
		closeBar()
	end)

	elements.textBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			processCommand()
			closeBar()
		end
	end)

	local function parentGui()
		if LocalPlayer then
			elements.gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
		else
			Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			elements.gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
		end
	end
	parentGui()
end

initCommandBar()
