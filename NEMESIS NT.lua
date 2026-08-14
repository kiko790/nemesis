loadstring(game:HttpGet("https://raw.githubusercontent.com/ykknzo-hub/notid/refs/heads/main/notfications.lua"))()
loadstring(game:HttpGet("https://pastebin.com/raw/yadNpJhU"))()


local GRADIENT_COLOR_A    = Color3.fromRGB(90, 180, 255)
local GRADIENT_COLOR_B    = Color3.fromRGB(245, 250, 255)
local GRADIENT_SPIN_SPEED = 60

local ZOOMOUT_SIZE     = UDim2.new(0, 40, 0, 40)
local ZOOMOUT_RADIUS   = UDim.new(0, 8)
local ZOOMOUT_DISTANCE = 60
local TAG_VIEW_DISTANCE = 9999999999999999999999999999999999999999

local TP_SOUND_ID = 135640489101126

local getasset = getcustomasset 
	or getsynasset 
	or (getgenv and (getgenv().getcustomasset or getgenv().getsynasset))

local THEMES = {
	purple = {
		Color3.fromRGB(150,  60, 255),
		Color3.fromRGB(255, 150, 255),
	},
	gold = {
		Color3.fromRGB(255, 180,  20),
		Color3.fromRGB(255, 255, 180),
	},
	cyan = {
		Color3.fromRGB(90, 180, 255),
		Color3.fromRGB(245, 250, 255),
	},
	fire = {
		Color3.fromRGB(255,  50,   0),
		Color3.fromRGB(255, 230,  50),
	},
	bw = {
		Color3.fromRGB(40, 40, 40),
		Color3.fromRGB(220, 220, 220),
	},
	red = {
		Color3.fromRGB(200, 0, 0),
		Color3.fromRGB(0, 0, 0),
	},
}

local CONFIG = {
	RankText           = "NEMESIS USER",
	DisplayName        = "@user",
	Theme              = "cyan",

	ShimmerEnabled     = true,
	PulseEnabled       = true,
	RainbowRankEnabled = false,
	FloatAmplitude     = 0.08,
	FloatSpeed         = 1.4,

	RankEffect         = "typing",

	UseAnimatedBg      = true,             
	SpriteFile         = "default_bg.png", 
	FrameColumns       = 5,               
	FrameRows          = 4,             
	TotalFrames        = 20,               
	FramesPerSec       = 16,               

	LogoSizeMultiplier = 0.8, 
	LogoPadding        = 6,    
	LogoInnerScale     = 1.0, 
}

local DEFAULT_TAG_WIDTH    = 180
local DEFAULT_TAG_HEIGHT   = 50
local DEFAULT_TAG_OFFSET_Y = 1.7  
local TAG_CORNER           = UDim.new(0, 14) 

local LOGO_FILE = "nemesis-no-bg.png"
local LOGO_URL  = "https://i.ibb.co/8DPYtKvx/nemesis-no-bg.png"
local OWNER_LOGO_FILE = "blue_crown_test_logo.png"
local OWNER_LOGO_URL  = "https://cdn.discordapp.com/attachments/1491906371812069610/1533943555746304251/blue_crown_test_logo.png?ex=6a7253c2&is=6a710242&hm=0d4d30f3ac9b5d964ec393cde74f86c09a710a0820d3b86c6d16158900033e3e&"

local customPlayers = {
	["kryliczx"] = {
		customName = "FOUNDER",
		gradientA  = Color3.fromRGB(173, 216, 230),
		gradientB  = Color3.fromRGB(173, 216, 230),
		rankEffect = "typing",

		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.7,

		logoAsset  = "yktagpfp.png",
		logoURL    = "https://i.ibb.co/XrSSgjmW/Nanami-Kento-Fight-Scene-PNG-Transparent-jpg-removebg-preview.png",

		useAnimatedBg = true,

		spriteFile   = "yktag.png",
        spriteURL    = "https://i.ibb.co/Y7ddWVyk/image.png",  
		frameColumns = 5,   
		frameRows    = 4,    
		totalFrames  = 20,   
		framesPerSec = 5,   

		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
	},
		["1vc_z"] = {
		customName = "FOUNDER",
		gradientA  = Color3.fromRGB(173, 216, 230),
		gradientB  = Color3.fromRGB(173, 216, 230),
		rankEffect = "typing",

		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.7,

		logoAsset  = "yktagpfp.png",
		logoURL    = "https://i.ibb.co/XrSSgjmW/Nanami-Kento-Fight-Scene-PNG-Transparent-jpg-removebg-preview.png",

		useAnimatedBg = true,

		spriteFile   = "yktag.png",
        spriteURL    = "https://i.ibb.co/Y7ddWVyk/image.png",  
		frameColumns = 5,   
		frameRows    = 4,    
		totalFrames  = 20,   
		framesPerSec = 5,   

		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
	},
	["Angel_E010"] = {
		customName = "beaner angel",
		gradientA  = Color3.fromRGB(255, 255, 255),
		gradientB  = Color3.fromRGB(0, 0, 0),
		rankEffect = "typing",

		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.7,

		logoAsset  = "angellogo.png",
		logoURL    = "https://i.ibb.co/398fwh1F/angellogo.png",

		useAnimatedBg = true,

		spriteFile   = "angelsgif.png",
		spriteURL    = "https://i.ibb.co/xKKQnv8W/image.png", 
		frameColumns = 5,   
		frameRows    = 4,    
		totalFrames  = 17,   
		framesPerSec = 10,   

		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
	},
	["Robloxianw3s1j0e2o"] = {
		customName = "OWNER",
		gradientA  = Color3.fromRGB(255, 255, 255),
		gradientB  = Color3.fromRGB(0, 0, 0),
		rankEffect = "typing",

		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.7,

		logoAsset  = "kikocrown.png",
		logoURL    = "https://i.ibb.co/b52KFvR5/kikocrown.png",

		useAnimatedBg = true,

		spriteFile   = "yklogo1.png",
		spriteURL    = "https://i.ibb.co/j9yf7rd2/yktag1.png", 
		frameColumns = 5,   
		frameRows    = 3,    
		totalFrames  = 15,   
		framesPerSec = 4,   

		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
	},
	["bovkiko"] = {
		customName = "OWNER",
		gradientA  = Color3.fromRGB(255, 255, 255),
		gradientB  = Color3.fromRGB(0, 0, 0),
		rankEffect = "typing",

		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.7,

		logoAsset  = "kikocrown.png",
		logoURL    = "https://i.ibb.co/b52KFvR5/kikocrown.png",

		useAnimatedBg = true,

		spriteFile   = "yklogo1.png",
		spriteURL    = "https://i.ibb.co/j9yf7rd2/yktag1.png", 
		frameColumns = 5,   
		frameRows    = 3,    
		totalFrames  = 15,   
		framesPerSec = 4,   

		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
	},
	["g6h2z"] = {
		customName = "PAPA CHRON",
		gradientA  = Color3.fromRGB(255, 255, 255),
		gradientB  = Color3.fromRGB(255, 255, 255),
		rankEffect = "typing",

		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.7,

		logoAsset  = "",
		logoURL    = "",

		useAnimatedBg = true,

		spriteFile   = "mrmtagv2.png",
        spriteURL    = "https://i.ibb.co/BKjn9FCV/image.png",  
		frameColumns = 5,   
		frameRows    = 4,    
		totalFrames  = 20,   
		framesPerSec = 5,   

		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
	},
	["Mrm_oeiee22"] = {
		customName = "PAPA CHRON",
		gradientA  = Color3.fromRGB(255, 255, 255),
		gradientB  = Color3.fromRGB(255, 255, 255),
		rankEffect = "typing",

		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.7,

		logoAsset  = "",
		logoURL    = "",

		useAnimatedBg = true,

		spriteFile   = "mrmtagv2.png",
        spriteURL    = "https://i.ibb.co/BKjn9FCV/image.png",  
		frameColumns = 5,   
		frameRows    = 4,    
		totalFrames  = 20,   
		framesPerSec = 5,   

		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
	},
}

local function getThemeColors()
	return THEMES[CONFIG.Theme] or THEMES.red
end

local function lerp(a, b, t) return a + (b - a) * t end

local function lerpColor(c1, c2, t)
	return Color3.new(
		lerp(c1.R, c2.R, t),
		lerp(c1.G, c2.G, t),
		lerp(c1.B, c2.B, t)
	)
end

local function cyclicLerp(colors, t)
	local n    = #colors
	local pos  = (t % 1) * n
	local idx  = math.floor(pos) + 1
	local frac = pos - math.floor(pos)
	local c1   = colors[idx]
	local c2   = colors[(idx % n) + 1]
	return lerpColor(c1, c2, frac)
end

local function makeColorSequence(colors)
	local kps = {}
	for i, c in ipairs(colors) do
		kps[i] = ColorSequenceKeypoint.new((i - 1) / (#colors - 1), c)
	end
	return ColorSequence.new(kps)
end

local function randomBetween(a, b) return a + math.random() * (b - a) end

local function startTypingEffect(label, fullText)
	task.spawn(function()
		local chars   = #fullText
		local phase   = "pause_full"
		local blinks  = 0
		local curOn   = true

		while label and label.Parent do
			if phase == "pause_full" then
				label.Text = fullText .. "|"
				task.wait(1.5)
				phase  = "blink_loop"
				blinks = 0
				curOn  = true

			elseif phase == "blink_loop" then
				curOn = not curOn
				label.Text = curOn and (fullText .. "|") or fullText
				task.wait(0.5)
				blinks = blinks + 0.5
				if blinks >= 3 then
					task.wait(0.3)
					phase = "delete"
					label.Text = fullText .. "|"
				end

			elseif phase == "delete" then
				if chars > 0 then
					chars = chars - 1
					label.Text = string.sub(fullText, 1, chars) .. "|"
					task.wait(0.05)
				else
					phase = "pause_empty"
					task.wait(0.4)
					phase = "type"
				end

			elseif phase == "type" then
				if chars < #fullText then
					chars = chars + 1
					label.Text = string.sub(fullText, 1, chars) .. "|"
					task.wait(0.07)
				else
					phase = "pause_full"
				end
			end
		end
	end)
end

local GLITCH_CHARS = {"#","@","!","$","%","&","?","*","/","\\","|","~","^","X","Z"}

local function glitchString(original)
	local result = {}
	for i = 1, #original do
		if math.random() < 0.4 then
			result[i] = GLITCH_CHARS[math.random(1, #GLITCH_CHARS)]
		else
			result[i] = string.sub(original, i, i)
		end
	end
	return table.concat(result)
end

local function startGlitchEffect(label, fullText)
	task.spawn(function()
		while label and label.Parent do
			task.wait(randomBetween(2.0, 4.5))
			if not label or not label.Parent then break end
			local iters = math.random(5, 10)
			for _ = 1, iters do
				if not label or not label.Parent then break end
				label.Text = glitchString(fullText)
				task.wait(0.04)
			end
			if label and label.Parent then
				label.Text = fullText
			end
		end
	end)
end

local function startWaveEffect(parent, fullText, basePos, textColor, font)
	local CHAR_W  = 7
	local startX  = basePos.X.Offset
	local startYs = basePos.Y.Scale
	local startYo = basePos.Y.Offset

	local charLabels = {}
	for i = 1, #fullText do
		local ch  = string.sub(fullText, i, i)
		local lbl = Instance.new("TextLabel")
		lbl.Parent               = parent
		lbl.Size                 = UDim2.new(0, CHAR_W + 2, 0, 16)
		lbl.Position             = UDim2.new(basePos.X.Scale, startX + (i - 1) * CHAR_W, startYs, startYo)
		lbl.BackgroundTransparency = 1
		lbl.Text                 = ch == " " and "\u{00A0}" or ch
		lbl.TextColor3           = textColor
		lbl.Font                 = font
		lbl.TextScaled           = false
		lbl.TextSize             = 12
		lbl.TextStrokeTransparency = 0.5
		lbl.TextStrokeColor3     = Color3.fromRGB(0, 0, 0)
		lbl.ZIndex               = 5
		charLabels[i]            = lbl
	end

	local running = true

	task.spawn(function()
		local t = 0
		while running do
			t = t + 0.05
			for i, lbl in ipairs(charLabels) do
				if not lbl or not lbl.Parent then running = false break end
				local wave = math.sin(t * 4 + (i - 1) * 0.75) * 2.8
				lbl.Position = UDim2.new(
					basePos.X.Scale,
					startX + (i - 1) * CHAR_W,
					startYs,
					startYo + wave
				)
			end
			task.wait(0.05)
		end
	end)

	return function()
		running = false
		for _, lbl in ipairs(charLabels) do
			if lbl and lbl.Parent then lbl:Destroy() end
		end
	end
end

local plrs       = game:GetService("Players")
local txtChat    = game:GetService("TextChatService")
local tweenSvc   = game:GetService("TweenService")
local runSvc     = game:GetService("RunService")
local starterGui = game:GetService("StarterGui")
local soundSvc   = game:GetService("SoundService")
local lp         = plrs.LocalPlayer

local taggedPlrs    = {}
local respondedPlrs = {}
local mutualPlrs    = {}

local function playTpSound()
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://" .. tostring(TP_SOUND_ID)
	s.Volume = 1
	s.Parent = soundSvc
	s:Play()
	s.Ended:Connect(function()
		s:Destroy()
	end)
end

local function ensureImage(filePath, url)
	if filePath and url and not isfile(filePath) then
		local success, data = pcall(function()
			return game:HttpGet(url)
		end)
		if success and data then
			writefile(filePath, data)
		end
	end
end

ensureImage(LOGO_FILE, LOGO_URL)
ensureImage(OWNER_LOGO_FILE, OWNER_LOGO_URL)

local function loadImage(filePath, fallbackUrl)
	if filePath and not isfile(filePath) then
		ensureImage(filePath, fallbackUrl or LOGO_URL)
	end
	if getasset and filePath then
		local success, result = pcall(function()
			return getasset(filePath)
		end)
		if success then return result end
	end
	return ""
end

local function getCustomData(plr)
	if customPlayers[plr.Name]   then return customPlayers[plr.Name]   end
	if customPlayers[plr.UserId] then return customPlayers[plr.UserId] end
	return nil
end

local function buildTag(plr)
	if not mutualPlrs[plr.UserId] then return end
	local char = plr.Character
	if not char then return end
	local hd  = char:FindFirstChild("Head")
	if not hd  then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	taggedPlrs[plr.UserId] = true

	local pg = lp:WaitForChild("PlayerGui")
	for _, obj in pairs(pg:GetChildren()) do
		if obj.Name == "NEMESISTag_" .. plr.UserId then obj:Destroy() end
	end

	local customData  = getCustomData(plr)
	local displayName = customData and customData.customName or CONFIG.RankText
	local gradA       = (customData and customData.gradientA) or GRADIENT_COLOR_A
	local gradB       = (customData and customData.gradientB) or GRADIENT_COLOR_B

	local tagWidth       = (customData and customData.tagWidth) or DEFAULT_TAG_WIDTH
	local tagHeight      = (customData and customData.tagHeight) or DEFAULT_TAG_HEIGHT
	local tagOffsetY     = (customData and customData.tagOffsetY) or DEFAULT_TAG_OFFSET_Y
	local currentTagSize = UDim2.new(0, tagWidth, 0, tagHeight)
	local currentTagOff  = Vector3.new(0, tagOffsetY, 0)

	local resolvedRankEffect
	if customData then
		resolvedRankEffect = customData.rankEffect or "none"
	else
		resolvedRankEffect = CONFIG.RankEffect
	end

	local function getColors()
		if gradA and gradB then
			return {gradA, gradB}
		end
		if plr == lp then
			return getThemeColors()
		end
		return {GRADIENT_COLOR_A, GRADIENT_COLOR_B}
	end

	local finalColors = getColors()
	local tagColor    = finalColors[1] or Color3.fromRGB(255, 0, 0)

	local bb = Instance.new("BillboardGui")
	bb.Name        = "NEMESISTag_" .. plr.UserId
	bb.Parent      = pg
	bb.Size        = currentTagSize
	bb.StudsOffset = currentTagOff
	bb.AlwaysOnTop = true
	bb.MaxDistance  = math.huge
	bb.Adornee     = hd
	bb.Active      = true

	local btn = Instance.new("TextButton")
	btn.Parent               = bb
	btn.Size                 = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.Text                 = ""
	btn.ZIndex               = 20
	btn.AutoButtonColor      = false
	btn.Active               = true
	if plr ~= lp then
		btn.MouseButton1Click:Connect(function()
			local myChar = lp.Character
			if myChar and myChar:FindFirstChild("HumanoidRootPart") and hrp and hrp.Parent then
				playTpSound()
				myChar.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, 3)
			end
		end)
	end

	local bg = Instance.new("Frame")
	bg.Parent               = bb
	bg.Size                 = UDim2.new(1, 0, 1, 0)
	bg.BackgroundColor3     = Color3.fromRGB(15, 12, 24)
	bg.BorderSizePixel      = 0
	bg.BackgroundTransparency = 0.12
	bg.ZIndex               = 1
	bg.ClipsDescendants     = true 
	Instance.new("UICorner", bg).CornerRadius = TAG_CORNER

	local bgGrad = Instance.new("UIGradient")
	bgGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, finalColors[1]),
		ColorSequenceKeypoint.new(1, finalColors[2] or finalColors[1]),
	})
	bgGrad.Rotation = 135
	bgGrad.Parent   = bg

	local isAnimatedBg = customData and customData.useAnimatedBg
	local staticBgFile = customData and customData.staticBgFile
	local staticBgURL  = customData and customData.staticBgURL

	if isAnimatedBg then
		local spriteFileName = customData.spriteFile or "testing.png"
		local spriteURL      = customData.spriteURL
		local cols           = customData.frameColumns or 5
		local rows           = customData.frameRows or 4
		local totFrames      = customData.totalFrames or 20
		local fps            = customData.framesPerSec or 12
		
		ensureImage(spriteFileName, spriteURL)

		if getasset and isfile(spriteFileName) then
			local animImage = Instance.new("ImageLabel")
			animImage.Name                 = "AnimatedBg"
			animImage.Size                 = UDim2.new(1, 0, 1, 0)
			animImage.Position             = UDim2.new(0, 0, 0, 0)
			animImage.BackgroundTransparency = 1
			animImage.Image                = getasset(spriteFileName)
			animImage.ScaleType            = Enum.ScaleType.Crop
			animImage.ZIndex               = 2
			animImage.Parent               = bg
			Instance.new("UICorner", animImage).CornerRadius = TAG_CORNER

			task.spawn(function()
				while animImage and animImage.Parent and animImage.ContentImageSize == Vector2.zero do
					task.wait()
				end

				if animImage and animImage.Parent then
					local realWidth   = animImage.ContentImageSize.X
					local realHeight  = animImage.ContentImageSize.Y
					local fWidth      = realWidth / cols
					local fHeight     = realHeight / rows

					animImage.ImageRectSize = Vector2.new(fWidth, fHeight)

					local currentFrame = 0
					local elapsed      = 0
					local frameDur     = 1 / fps

					local animConn
					animConn = runSvc.Heartbeat:Connect(function(dt)
						if not animImage or not animImage.Parent or not bb or not bb.Parent then
							animConn:Disconnect()
							return
						end

						elapsed = elapsed + dt
						if elapsed >= frameDur then
							elapsed = elapsed % frameDur
							currentFrame = (currentFrame + 1) % totFrames

							local c = currentFrame % cols
							local r = math.floor(currentFrame / cols)
							animImage.ImageRectOffset = Vector2.new(c * fWidth, r * fHeight)
						end
					end)
				end
			end)
		end
	elseif staticBgFile then
		local staticImage = Instance.new("ImageLabel")
		staticImage.Name                 = "StaticBg"
		staticImage.Size                 = UDim2.new(1, 0, 1, 0)
		staticImage.Position             = UDim2.new(0, 0, 0, 0)
		staticImage.BackgroundTransparency = 1
		staticImage.Image                = loadImage(staticBgFile, staticBgURL)
		staticImage.ScaleType            = Enum.ScaleType.Crop
		staticImage.ZIndex               = 2
		staticImage.Parent               = bg
		Instance.new("UICorner", staticImage).CornerRadius = TAG_CORNER
	end

	local stroke = Instance.new("UIStroke")
	stroke.Parent          = bg
	stroke.Color           = Color3.fromRGB(255, 255, 255)
	stroke.Thickness       = 1.5
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Transparency    = 0.4
	local strokeGrad = Instance.new("UIGradient")
	strokeGrad.Color    = ColorSequence.new(finalColors[1], finalColors[2] or finalColors[1])
	strokeGrad.Rotation = 0
	strokeGrad.Parent   = stroke

	local shimmer = Instance.new("Frame")
	shimmer.Name                       = "Shimmer"
	shimmer.Size                       = UDim2.new(0.35, 0, 1, 0)
	shimmer.Position                   = UDim2.new(-0.35, 0, 0, 0)
	shimmer.BackgroundColor3           = Color3.new(1, 1, 1)
	shimmer.BackgroundTransparency     = 0.82
	shimmer.BorderSizePixel            = 0
	shimmer.ZIndex                     = 8
	shimmer.ClipsDescendants           = false
	shimmer.Parent                     = bg
	Instance.new("UICorner", shimmer).CornerRadius = TAG_CORNER

	local shimGrad = Instance.new("UIGradient")
	shimGrad.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0,    1),
		NumberSequenceKeypoint.new(0.45, 0.6),
		NumberSequenceKeypoint.new(0.5,  0.3),
		NumberSequenceKeypoint.new(0.55, 0.6),
		NumberSequenceKeypoint.new(1,    1),
	})
	shimGrad.Rotation = 15
	shimGrad.Parent   = shimmer
	
	local logoSizeMult = customData and customData.logoSizeMultiplier or CONFIG.LogoSizeMultiplier
	local logoPadVal   = customData and customData.logoPadding or CONFIG.LogoPadding
	local innerScale   = customData and customData.logoInnerScale or CONFIG.LogoInnerScale
	local innerOffset  = (1 - innerScale) / 2
	
	local IMG_W       = math.floor(tagHeight * logoSizeMult)
	local IMG_PAD     = logoPadVal
	local TEXT_OFFSET = IMG_PAD + IMG_W + 7

	local logoHolder = Instance.new("Frame")
	logoHolder.Name               = "LogoHolder"
	logoHolder.Parent             = bg
	logoHolder.Size               = UDim2.new(0, IMG_W, 0, IMG_W)
	logoHolder.Position           = UDim2.new(0, IMG_PAD, 0.5, -IMG_W/2)
	logoHolder.BackgroundColor3   = Color3.fromRGB(25, 20, 35)
	logoHolder.BackgroundTransparency = 1
	logoHolder.BorderSizePixel    = 0
	logoHolder.ZIndex             = 4
	logoHolder.ClipsDescendants   = true
	Instance.new("UICorner", logoHolder).CornerRadius = UDim.new(1, 0)

	local logoImg = Instance.new("ImageLabel")
	logoImg.Name                 = "LogoImage"
	logoImg.Parent               = logoHolder
	logoImg.Size                 = UDim2.new(innerScale, 0, innerScale, 0)
	logoImg.Position             = UDim2.new(innerOffset, 0, innerOffset, 0)
	logoImg.BackgroundTransparency = 1
	logoImg.Image                = loadImage((customData and customData.logoAsset) or LOGO_FILE, (customData and customData.logoURL) or LOGO_URL)
	logoImg.ScaleType            = Enum.ScaleType.Crop
	logoImg.ZIndex               = 5
	Instance.new("UICorner", logoImg).CornerRadius = UDim.new(1, 0)

	local kzk = Instance.new("TextLabel")
	kzk.Name                 = "DisplayName"
	kzk.Parent               = bg
	kzk.Size                 = UDim2.new(1, -(TEXT_OFFSET + 8), 0, math.floor(tagHeight * 0.38))
	kzk.Position             = UDim2.new(0, TEXT_OFFSET, 0, math.floor(tagHeight * 0.15))
	kzk.BackgroundTransparency = 1
	kzk.Text                 = displayName
	kzk.TextColor3           = Color3.fromRGB(255, 255, 255)
	kzk.TextScaled           = true
	kzk.TextXAlignment       = Enum.TextXAlignment.Left
	kzk.Font                 = Enum.Font.LuckiestGuy
	kzk.TextStrokeTransparency = 0.5
	kzk.TextStrokeColor3     = Color3.fromRGB(0, 0, 0)
	kzk.ZIndex               = 5

	local kzkConstraint = Instance.new("UITextSizeConstraint")
	kzkConstraint.MaxTextSize = math.floor(tagHeight * 0.32)
	kzkConstraint.Parent      = kzk

	local kzkGrad = Instance.new("UIGradient")
	kzkGrad.Color    = ColorSequence.new(tagColor)
	kzkGrad.Rotation = 0
	kzkGrad.Parent   = kzk

	local cursorLabel = Instance.new("TextLabel")
	cursorLabel.Name                 = "TypingCursor"
	cursorLabel.Parent               = bg
	cursorLabel.Size                 = UDim2.new(0, 8, 0, 16)
	cursorLabel.Position             = UDim2.new(0, TEXT_OFFSET, 0, 10)
	cursorLabel.BackgroundTransparency = 1
	cursorLabel.Text                 = ""
	cursorLabel.TextColor3           = Color3.fromRGB(255, 255, 255)
	cursorLabel.TextScaled           = true
	cursorLabel.TextXAlignment       = Enum.TextXAlignment.Left
	cursorLabel.Font                 = Enum.Font.LuckiestGuy
	cursorLabel.ZIndex               = 5
	cursorLabel.Visible              = false

	local dname = Instance.new("TextLabel")
	dname.Name               = "Username"
	dname.Parent             = bg
	dname.Size               = UDim2.new(1, -(TEXT_OFFSET + 8), 0, math.floor(tagHeight * 0.26))
	dname.Position           = UDim2.new(0, TEXT_OFFSET, 0.55, 0)
	dname.BackgroundTransparency = 1
	dname.Text               = "@" .. plr.Name
	dname.TextColor3         = Color3.fromRGB(255, 255, 255)
	dname.TextScaled         = true
	dname.TextXAlignment     = Enum.TextXAlignment.Left
	dname.Font               = Enum.Font.Gotham
	dname.TextStrokeTransparency = 0.85
	dname.ZIndex             = 5

	local dnameGrad = Instance.new("UIGradient")
	dnameGrad.Name   = "UserGrad"
	dnameGrad.Color  = ColorSequence.new(finalColors[1], finalColors[2] or finalColors[1])
	dnameGrad.Rotation = 0
	dnameGrad.Parent = dname

	local dnameConstraint = Instance.new("UITextSizeConstraint")
	dnameConstraint.MaxTextSize = math.floor(tagHeight * 0.22)
	dnameConstraint.Parent      = dname

	local waveCleanup = nil

	if resolvedRankEffect == "typing" then
		cursorLabel.Visible = false
		startTypingEffect(kzk, displayName)
	elseif resolvedRankEffect == "glitch" then
		startGlitchEffect(kzk, displayName)
	elseif resolvedRankEffect == "wave" then
		kzk.Visible = false
		cursorLabel.Visible = false
		waveCleanup = startWaveEffect(
			bg,
			displayName,
			UDim2.new(0, TEXT_OFFSET, 0, 8),
			Color3.fromRGB(255, 255, 255),
			Enum.Font.GothamBold
		)
	end

	task.spawn(function()
		while bb and bb.Parent do
			for i = 0, 1, 0.1 do
				if not stroke or not stroke.Parent then break end
				stroke.Transparency = 0.3 + (i * 0.3)
				task.wait(0.03)
			end
			for i = 1, 0, -0.1 do
				if not stroke or not stroke.Parent then break end
				stroke.Transparency = 0.3 + (i * 0.3)
				task.wait(0.03)
			end
			task.wait(0.2)
		end
	end)

	local pFrm = Instance.new("Frame")
	pFrm.Parent               = bg
	pFrm.Size                 = UDim2.new(1, 0, 1, 0)
	pFrm.BackgroundTransparency = 1
	pFrm.ClipsDescendants     = true
	pFrm.ZIndex               = 3
	Instance.new("UICorner", pFrm).CornerRadius = TAG_CORNER
	for i = 1, 18 do
		local dot = Instance.new("Frame")
		dot.Parent              = pFrm
		local sz                = math.random(1, 3)
		dot.Size                = UDim2.new(0, sz, 0, sz)
		dot.Position            = UDim2.new(math.random() * 0.95, 0, math.random() * 0.95, 0)
		dot.BackgroundColor3    = finalColors[math.random(1, #finalColors)]
		dot.BackgroundTransparency = math.random(60, 90) / 100
		dot.ZIndex              = 3
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
	end

	task.spawn(function()
		while bb and bb.Parent do
			for _, dot in pairs(pFrm:GetChildren()) do
				if dot:IsA("Frame") then
					local pos  = dot.Position
					local yVal = pos.Y.Scale - 0.008
					if yVal < -0.1 then yVal = 1.1 end
					dot.Position           = UDim2.new(pos.X.Scale, 0, yVal, 0)
					dot.BackgroundTransparency = 0.3 + math.random(0, 50) / 100
				end
			end
			task.wait(0.05)
		end
	end)

	local tweenCfg = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local isZoomed = false

	local t0 = tick()
	local connection
	connection = runSvc.Heartbeat:Connect(function()
		if not bb or not bb.Parent then
			connection:Disconnect()
			if waveCleanup then waveCleanup() end
			return
		end

		-- Dynamic re-adornee check in case character parts are cloned or swapped dynamically
		if not hd or not hd.Parent or bb.Adornee ~= hd then
			local newChar = plr.Character
			local newHead = newChar and newChar:FindFirstChild("Head")
			if newHead then
				hd = newHead
				bb.Adornee = newHead
			end
		end

		local t = tick() - t0
		local colors = getColors()

		if CONFIG.ShimmerEnabled then
			local sweepPos = (t * 0.45) % 1.7 - 0.35
			shimmer.Position = UDim2.new(sweepPos - 0.35, 0, 0, 0)
		end

		if CONFIG.PulseEnabled then
			local pulse = 0.3 + 0.15 * math.sin(t * 2.2)
			stroke.Transparency = pulse
		end

		strokeGrad.Rotation = 0
		strokeGrad.Color = makeColorSequence(colors)

		if not CONFIG.RainbowRankEnabled or plr ~= lp then
			kzk.TextColor3 = Color3.fromRGB(255, 255, 255)
			local c1 = colors[1]:Lerp(Color3.new(1,1,1), 0.3)
			local c2 = (colors[2] or colors[1]):Lerp(Color3.new(1,1,1), 0.3)
			kzkGrad.Color    = makeColorSequence({c1, c2})
			kzkGrad.Rotation = 0
			local dgr = dname:FindFirstChild("UserGrad")
			if dgr then dgr.Color = makeColorSequence({c1, c2}) end
		else
			kzk.TextColor3 = cyclicLerp(colors, (t * 0.5) % 1)
			kzkGrad.Color = makeColorSequence({
				cyclicLerp(colors, (t * 0.5)       % 1),
				cyclicLerp(colors, (t * 0.5 + 0.5) % 1),
			})
			kzkGrad.Rotation = (t * 50) % 360
		end

		local floatY = math.sin(t * CONFIG.FloatSpeed) * CONFIG.FloatAmplitude
		bb.StudsOffset = currentTagOff + Vector3.new(0, floatY, 0)

		local camera = workspace.CurrentCamera
		if camera and hd and hd.Parent then
			local dist = (camera.CFrame.Position - hd.Position).Magnitude
			if dist > ZOOMOUT_DISTANCE and not isZoomed then
				isZoomed = true
				tweenSvc:Create(bb, tweenCfg, {Size = ZOOMOUT_SIZE}):Play()
				tweenSvc:Create(logoHolder, tweenCfg, {
					Position = UDim2.new(0.5, -ZOOMOUT_SIZE.Y.Offset/2, 0.5, -ZOOMOUT_SIZE.Y.Offset/2),
					Size     = UDim2.new(0, ZOOMOUT_SIZE.Y.Offset, 0, ZOOMOUT_SIZE.Y.Offset),
				}):Play()

				kzk.Visible         = false
				dname.Visible       = false
				cursorLabel.Visible = false
				pFrm.Visible        = false
			elseif dist <= ZOOMOUT_DISTANCE and isZoomed then
				isZoomed = false
				tweenSvc:Create(bb, tweenCfg, {Size = currentTagSize}):Play()
				tweenSvc:Create(logoHolder, tweenCfg, {
					Position = UDim2.new(0, IMG_PAD, 0.5, -IMG_W/2),
					Size     = UDim2.new(0, IMG_W, 0, IMG_W),
				}):Play()
				kzk.Visible         = (resolvedRankEffect ~= "wave")
				dname.Visible       = true
				cursorLabel.Visible = false
				pFrm.Visible        = true
			end
		end

		for _, p in pairs(plrs:GetPlayers()) do
			local c = p.Character
			local h = c and c:FindFirstChild("Humanoid")
			if h then
				h.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				h.NameDisplayDistance = 0
				h.HealthDisplayDistance = 0
			end
		end
	end)
end

local function rebuildTag(plr)
	taggedPlrs[plr.UserId] = nil
	task.wait(0.3)
	buildTag(plr)
end

for _, plr in pairs(plrs:GetPlayers()) do
	plr.CharacterAdded:Connect(function(char)
		local hum = char:WaitForChild("Humanoid", 5)
		if hum then
			hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			hum.NameDisplayDistance = 0
			hum.HealthDisplayDistance = 0
		end
		char:WaitForChild("Head", 5)
		rebuildTag(plr)
	end)
end

local function setupLocalCharacter(char)
	local hum = char:WaitForChild("Humanoid", 5)
	if hum then
		hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		hum.NameDisplayDistance = 0
		hum.HealthDisplayDistance = 0
	end
	char:WaitForChild("Head", 5)
	
	local pg = lp:WaitForChild("PlayerGui")
	if pg then
		for _, obj in pairs(pg:GetChildren()) do
			if string.find(obj.Name, "NEMESISTag_") then
				obj:Destroy()
			end
		end
	end
	
	table.clear(taggedPlrs)
	mutualPlrs[lp.UserId] = true
	
	buildTag(lp)
	
	task.wait(1)
	local channels = txtChat:FindFirstChild("TextChannels")
	local general  = channels and channels:FindFirstChild("RBXGeneral")
	if general then
		general:SendAsync("↑")
	end
	
	for userId, _ in pairs(mutualPlrs) do
		local p = plrs:GetPlayerByUserId(userId)
		if p then rebuildTag(p) end
	end
end

lp.CharacterAdded:Connect(setupLocalCharacter)

-- Listens to avatar/appearance updates (such as outfit morphs or avatar clones)
lp.CharacterAppearanceLoaded:Connect(function(char)
	task.wait(0.5)
	rebuildTag(lp)
end)

plrs.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		local hum = char:WaitForChild("Humanoid", 5)
		if hum then
			hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			hum.NameDisplayDistance = 0
			hum.HealthDisplayDistance = 0
		end
		char:WaitForChild("Head", 5)
		rebuildTag(plr)
	end)
end)

local hasInitialized = false

local function handleMessage(msg, ch)
	if not msg or not msg.Text then return end
	local text = msg.Text
	local src  = msg.TextSource
	if not src then return end
	local sender = plrs:GetPlayerByUserId(src.UserId)
	if not sender or sender == lp then return end

	local isLoadSignal = string.find(text, "↑")
	local isAckSignal  = string.find(text, "↓")

	if isLoadSignal then
		local replyKey = tostring(sender.UserId)
		if respondedPlrs[replyKey] or mutualPlrs[sender.UserId] then return end
		respondedPlrs[replyKey] = true
		
		mutualPlrs[sender.UserId] = true
		task.wait(0.5)
		ch:SendAsync("↓")
		
		local function applyTarget()
			if sender.Character and sender.Character:FindFirstChild("Head") and sender.Character:FindFirstChild("HumanoidRootPart") then
				buildTag(sender)
			else
				task.delay(1, applyTarget)
			end
		end
		applyTarget()
		ch:SendAsync("↑")
	elseif isAckSignal then
		mutualPlrs[sender.UserId] = true
		
		local function applyTarget()
			if sender.Character and sender.Character:FindFirstChild("Head") and sender.Character:FindFirstChild("HumanoidRootPart") then
				buildTag(sender)
			else
				task.delay(1, applyTarget)
			end
		end
		applyTarget()
	end
end

local channels = txtChat:WaitForChild("TextChannels", 5)
local general  = channels and channels:FindFirstChild("RBXGeneral")

if general then
	general.MessageReceived:Connect(function(msg) handleMessage(msg, general) end)
	task.wait(3)
	if not hasInitialized and next(mutualPlrs) == nil then
		hasInitialized = true
		general:SendAsync("↑")
	end
end

mutualPlrs[lp.UserId] = true
task.wait(1)
if lp.Character then buildTag(lp)
else lp.CharacterAdded:Wait(); task.wait(0.5); buildTag(lp) end

plrs.PlayerRemoving:Connect(function(plr)
	taggedPlrs[plr.UserId]    = nil
	respondedPlrs[tostring(plr.UserId)] = nil
	mutualPlrs[plr.UserId]    = nil
	local pg = lp:FindFirstChild("PlayerGui")
	if pg then
		local tag = pg:FindFirstChild("NEMESISTag_" .. plr.UserId)
		if tag then tag:Destroy() end
	end
end)

game:BindToClose(function()
	local pg = lp:FindFirstChild("PlayerGui")
	if pg then
		for _, obj in pairs(pg:GetChildren()) do
			if string.find(obj.Name, "NEMESISTag_") then obj:Destroy() end
		end
	end
end)

return {
	SetRankText = function(text)
		CONFIG.RankText = text
		local pg = lp:FindFirstChild("PlayerGui")
		if pg then
			local bb  = pg:FindFirstChild("NEMESISTag_" .. lp.UserId)
			local lbl = bb and bb:FindFirstChild("DisplayName", true)
			if lbl then lbl.Text = text end
		end
	end,

	SetDisplayName = function(name)
		CONFIG.DisplayName = name
		local pg = lp:FindFirstChild("PlayerGui")
		if pg then
			local bb  = pg:FindFirstChild("NEMESISTag_" .. lp.UserId)
			local lbl = bb and bb:FindFirstChild("Username", true)
			if lbl then lbl.Text = name end
		end
	end,

	SetTheme = function(themeName)
		if THEMES[themeName] then
			CONFIG.Theme = themeName
			rebuildTag(lp)
		end
	end,

	SetRainbow = function(enabled)
		CONFIG.RainbowRankEnabled = enabled
	end,

	SetRankEffect = function(effect)
		CONFIG.RankEffect = effect
		rebuildTag(lp)
	end,

	Rebuild = function()
		rebuildTag(lp)
	end,
}
