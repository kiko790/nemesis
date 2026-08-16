loadstring(game:HttpGet("https://raw.githubusercontent.com/ykknzo-hub/notid/refs/heads/main/notfications.lua"))()
loadstring(game:HttpGet("https://pastebin.com/raw/4pBESDiH"))()

local HttpService = game:GetService("HttpService")
local plrs = game:GetService("Players")
local tweenSvc = game:GetService("TweenService")
local runSvc = game:GetService("RunService")
local soundSvc = game:GetService("SoundService")
local lp = plrs.LocalPlayer

local API_URL = "https://backend.kenzielimonn.workers.dev"
local API_SECRET = "Pondelok5"
local JSON_URL = "https://raw.githubusercontent.com/ykknzo-hub/commandlist/refs/heads/main/nemesis%20cmd/tags.json"
local MAX_RETRIES = 3

local GRADIENT_COLOR_A = Color3.fromRGB(90, 180, 255)
local GRADIENT_COLOR_B = Color3.fromRGB(245, 250, 255)
local ZOOMOUT_SIZE = UDim2.new(0, 40, 0, 40)
local ZOOMOUT_DISTANCE = 60
local TP_SOUND_ID = 135640489101126

local getasset = getcustomasset
	or getsynasset
	or (getgenv and (getgenv().getcustomasset or getgenv().getsynasset))

local THEMES = {
	purple = { Color3.fromRGB(150, 60, 255), Color3.fromRGB(255, 150, 255) },
	gold   = { Color3.fromRGB(255, 180, 20), Color3.fromRGB(255, 255, 180) },
	cyan   = { Color3.fromRGB(90, 180, 255), Color3.fromRGB(245, 250, 255) },
	fire   = { Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 230, 50) },
	bw     = { Color3.fromRGB(40, 40, 40), Color3.fromRGB(220, 220, 220) },
	red    = { Color3.fromRGB(200, 0, 0), Color3.fromRGB(0, 0, 0) },
}

local CONFIG = {
	RankText = "NEMESIS USER",
	Theme = "cyan",
	ShimmerEnabled = true,
	PulseEnabled = true,
	RainbowRankEnabled = false,
	FloatAmplitude = 0.08,
	FloatSpeed = 1.4,
	RankEffect = "typing",
	LogoSizeMultiplier = 0.8,
	LogoPadding = 6,

	-- default animated bg (used when role has useAnimatedBg)
	UseAnimatedBg = true,
	SpriteFile = "default_bg.png",
	SpriteURL = "https://i.ibb.co/93CPw1vv/image.png",
	FrameColumns = 5,
	FrameRows = 4,
	TotalFrames = 20,
	FramesPerSec = 12,
}

local DEFAULT_TAG_WIDTH = 180
local DEFAULT_TAG_HEIGHT = 50
local DEFAULT_TAG_OFFSET_Y = 1.7
local TAG_CORNER = UDim.new(0, 14)

local LOGO_FILE = "nemesis-no-bg.png"
local LOGO_URL = "https://i.ibb.co/8DPYtKvx/nemesis-no-bg.png"

local ROLE_PRESETS = {
	[""] = {
		gradientA  = Color3.fromRGB(173, 216, 230),
		gradientB  = Color3.fromRGB(173, 216, 230),
		rankEffect = "",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.7,
		logoAsset  = "",
		logoURL    = "",
		useAnimatedBg = true,
		spriteFile   = "2200.png",
		spriteURL    = "https://i.ibb.co/sd7TTYG4/ezgif-2310ab27c9df1275.png",  
		frameColumns = 5,   
		frameRows    = 4,    
		totalFrames  = 20,   
		framesPerSec = 10,   
		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
	},
	["ANGEL"] = {
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
	["OWNER"] = {
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
	["PAPA CHRON"] = {
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

local customPlayers = {}
local taggedPlrs = {}
local mutualPlrs = {}

-- ===================== REQUEST =====================
local function request(method, url, body)
	local req = (syn and syn.request) or http_request or request or (fluxus and fluxus.request) or (http and http.request)
	if req then
		local success, response = pcall(function()
			return req({
				Url = url,
				Method = method,
				Headers = { ["Content-Type"] = "application/json" },
				Body = body and HttpService:JSONEncode(body) or nil
			})
		end)
		if success and response and response.Body then
			return response.Body
		end
	end
	local success, res = pcall(function()
		if method == "POST" then
			return game:HttpPost(url, body and HttpService:JSONEncode(body) or "", true)
		else
			return game:HttpGet(url)
		end
	end)
	return success and res or nil
end

local function api(method, path, body)
	local url = API_URL .. path .. "?secret=" .. API_SECRET
	local res = request(method, url, body)
	if res then
		local ok, data = pcall(function()
			return HttpService:JSONDecode(res)
		end)
		if ok then return data end
	end
	return nil
end

local function registerSelf()
	api("POST", "/register", {
		userId = lp.UserId,
		username = lp.Name
	})
end

local function removeUser(userId)
	api("POST", "/remove", {
		userId = userId
	})
end

-- ===================== IMAGE UTILS =====================
local function ensureImage(file, url)
	if not file or not url or file == "" or url == "" then return false end
	if isfile and isfile(file) then return true end
	local success, data = pcall(function()
		return game:HttpGet(url)
	end)
	if success and type(data) == "string" and #data > 100 then
		local wOk = pcall(writefile, file, data)
		return wOk and isfile and isfile(file)
	end
	return false
end

local function loadImage(file, url)
	ensureImage(file, url)
	if getasset and file and isfile and isfile(file) then
		local success, result = pcall(getasset, file)
		if success and result and result ~= "" then
			return result
		end
	end
	return ""
end

ensureImage(LOGO_FILE, LOGO_URL)

-- ===================== JSON =====================
local function fetchJson(url, retries)
	for i = 1, retries do
		local success, response = pcall(function()
			return game:HttpGet(url)
		end)
		if success and response then
			local ok, decoded = pcall(function()
				return HttpService:JSONDecode(response)
			end)
			if ok then return true, decoded end
		end
		task.wait(1)
	end
	return false, nil
end

local ok, remoteData = fetchJson(JSON_URL, MAX_RETRIES)
if ok and remoteData then
	for tagTitle, usernames in pairs(remoteData) do
		if type(usernames) == "table" then
			for _, username in ipairs(usernames) do
				local preset = ROLE_PRESETS[tagTitle] or ROLE_PRESETS[""] or {}
				local merged = {}
				for k, v in pairs(preset) do merged[k] = v end
				merged.customName = tagTitle
				customPlayers[username] = merged
			end
		end
	end
end

-- Pre-download all role sprites so tags never wait cold
for _, preset in pairs(ROLE_PRESETS) do
	if preset.spriteFile and preset.spriteURL then
		task.spawn(ensureImage, preset.spriteFile, preset.spriteURL)
	end
	if preset.logoAsset and preset.logoURL then
		task.spawn(ensureImage, preset.logoAsset, preset.logoURL)
	end
end

-- ===================== UTILS =====================
local function playTpSound()
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://" .. TP_SOUND_ID
	s.Volume = 1
	s.Parent = soundSvc
	s:Play()
	s.Ended:Connect(function() s:Destroy() end)
end

local function getCustomData(plr)
	return customPlayers[plr.Name] or customPlayers[tostring(plr.UserId)]
end

local function getThemeColors()
	return THEMES[CONFIG.Theme] or THEMES.cyan
end

local function startTypingEffect(label, fullText)
	task.spawn(function()
		local chars = #fullText
		local phase = "pause_full"
		local blinks = 0
		local curOn = true
		while label and label.Parent do
			if phase == "pause_full" then
				label.Text = fullText .. "|"
				task.wait(1.5)
				phase = "blink_loop"
				blinks = 0
				curOn = true
			elseif phase == "blink_loop" then
				curOn = not curOn
				label.Text = curOn and (fullText .. "|") or fullText
				task.wait(0.5)
				blinks = blinks + 0.5
				if blinks >= 3 then
					task.wait(0.3)
					phase = "delete"
				end
			elseif phase == "delete" then
				if chars > 0 then
					chars = chars - 1
					label.Text = string.sub(fullText, 1, chars) .. "|"
					task.wait(0.05)
				else
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

-- ===================== ANIMATED SPRITE BG =====================
local function startSpriteAnimation(animImage, cols, rows, totalFrames, fps)
	task.spawn(function()
		-- Wait until image is actually loaded
		local tries = 0
		while animImage and animImage.Parent and animImage.ContentImageSize == Vector2.zero and tries < 100 do
			task.wait(0.05)
			tries = tries + 1
		end
		if not animImage or not animImage.Parent then return end
		if animImage.ContentImageSize == Vector2.zero then return end

		local realWidth = animImage.ContentImageSize.X
		local realHeight = animImage.ContentImageSize.Y
		if realWidth <= 0 or realHeight <= 0 then return end

		local fWidth = realWidth / cols
		local fHeight = realHeight / rows
		animImage.ImageRectSize = Vector2.new(fWidth, fHeight)

		local currentFrame = 0
		local elapsed = 0
		local frameDur = 1 / math.max(1, fps)

		local animConn
		animConn = runSvc.Heartbeat:Connect(function(dt)
			if not animImage or not animImage.Parent then
				animConn:Disconnect()
				return
			end
			elapsed = elapsed + dt
			if elapsed >= frameDur then
				elapsed = elapsed % frameDur
				currentFrame = (currentFrame + 1) % totalFrames
				local c = currentFrame % cols
				local r = math.floor(currentFrame / cols)
				animImage.ImageRectOffset = Vector2.new(c * fWidth, r * fHeight)
			end
		end)
	end)
end

function buildTag(plr)
	if not mutualPlrs[plr.UserId] then return end
	local char = plr.Character
	if not char then return end
	local hd = char:FindFirstChild("Head")
	if not hd then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	taggedPlrs[plr.UserId] = true

	local pg = lp:WaitForChild("PlayerGui")
	for _, obj in pairs(pg:GetChildren()) do
		if obj.Name == "NEMESISTag_" .. plr.UserId then
			obj:Destroy()
		end
	end

	local customData = getCustomData(plr)
	local displayName = customData and customData.customName or CONFIG.RankText
	local gradA = (customData and customData.gradientA) or GRADIENT_COLOR_A
	local gradB = (customData and customData.gradientB) or GRADIENT_COLOR_B
	local tagWidth = (customData and customData.tagWidth) or DEFAULT_TAG_WIDTH
	local tagHeight = (customData and customData.tagHeight) or DEFAULT_TAG_HEIGHT
	local tagOffsetY = (customData and customData.tagOffsetY) or DEFAULT_TAG_OFFSET_Y
	local currentTagSize = UDim2.new(0, tagWidth, 0, tagHeight)
	local currentTagOff = Vector3.new(0, tagOffsetY, 0)
	local resolvedRankEffect = (customData and customData.rankEffect) or CONFIG.RankEffect

	local useAnim = true
	if customData and customData.useAnimatedBg ~= nil then
		useAnim = customData.useAnimatedBg
	elseif CONFIG.UseAnimatedBg ~= nil then
		useAnim = CONFIG.UseAnimatedBg
	end

	local spriteFile = (customData and customData.spriteFile) or CONFIG.SpriteFile
	local spriteURL  = (customData and customData.spriteURL) or CONFIG.SpriteURL
	local cols = (customData and customData.frameColumns) or CONFIG.FrameColumns
	local rows = (customData and customData.frameRows) or CONFIG.FrameRows
	local totFrames = (customData and customData.totalFrames) or CONFIG.TotalFrames
	local fps = (customData and customData.framesPerSec) or CONFIG.FramesPerSec

	local function getColors()
		if gradA and gradB then return { gradA, gradB } end
		return plr == lp and getThemeColors() or { GRADIENT_COLOR_A, GRADIENT_COLOR_B }
	end
	local finalColors = getColors()

	local bb = Instance.new("BillboardGui")
	bb.Name = "NEMESISTag_" .. plr.UserId
	bb.Parent = pg
	bb.Size = currentTagSize
	bb.StudsOffset = currentTagOff
	bb.AlwaysOnTop = true
	bb.MaxDistance = math.huge
	bb.Adornee = hd
	bb.Active = true

	local btn = Instance.new("TextButton")
	btn.Parent = bb
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.ZIndex = 30
	btn.AutoButtonColor = false
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
	bg.Parent = bb
	bg.Size = UDim2.new(1, 0, 1, 0)
	bg.BackgroundColor3 = Color3.fromRGB(12, 10, 20)
	bg.BackgroundTransparency = 0.1
	bg.BorderSizePixel = 0
	bg.ZIndex = 1
	bg.ClipsDescendants = true
	Instance.new("UICorner", bg).CornerRadius = TAG_CORNER

	local bgGrad = Instance.new("UIGradient")
	bgGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, finalColors[1]),
		ColorSequenceKeypoint.new(1, finalColors[2] or finalColors[1])
	})
	bgGrad.Rotation = 135
	bgGrad.Parent = bg

	------------------------------------------------------------------
	-- ANIMATED SPRITE BACKGROUND (fixed)
	------------------------------------------------------------------
	local animImage = nil
	if useAnim and spriteFile and spriteURL then
		local asset = loadImage(spriteFile, spriteURL)
		if asset and asset ~= "" then
			animImage = Instance.new("ImageLabel")
			animImage.Name = "AnimatedBg"
			animImage.Size = UDim2.new(1, 0, 1, 0)
			animImage.Position = UDim2.new(0, 0, 0, 0)
			animImage.BackgroundTransparency = 1
			animImage.Image = asset
			animImage.ScaleType = Enum.ScaleType.Crop
			animImage.ZIndex = 2
			animImage.Parent = bg
			Instance.new("UICorner", animImage).CornerRadius = TAG_CORNER

			startSpriteAnimation(animImage, cols, rows, totFrames, fps)
		end
	end

	local stroke = Instance.new("UIStroke")
	stroke.Parent = bg
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Thickness = 1.4
	stroke.Transparency = 0.45
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	local strokeGrad = Instance.new("UIGradient")
	strokeGrad.Color = ColorSequence.new(finalColors[1], finalColors[2] or finalColors[1])
	strokeGrad.Parent = stroke

	local IMG_W = math.floor(tagHeight * 0.72)
	local IMG_PAD = 7
	local TEXT_OFFSET = IMG_PAD + IMG_W + 8

	local logoHolder = Instance.new("Frame")
	logoHolder.Parent = bg
	logoHolder.Size = UDim2.new(0, IMG_W, 0, IMG_W)
	logoHolder.Position = UDim2.new(0, IMG_PAD, 0.5, -IMG_W / 2)
	logoHolder.BackgroundTransparency = 1
	logoHolder.ZIndex = 5
	logoHolder.ClipsDescendants = true
	Instance.new("UICorner", logoHolder).CornerRadius = UDim.new(1, 0)

	local logoImg = Instance.new("ImageLabel")
	logoImg.Parent = logoHolder
	logoImg.Size = UDim2.new(1, 0, 1, 0)
	logoImg.BackgroundTransparency = 1
	logoImg.Image = loadImage(
		(customData and customData.logoAsset) or LOGO_FILE,
		(customData and customData.logoURL) or LOGO_URL
	)
	logoImg.ScaleType = Enum.ScaleType.Crop
	logoImg.ZIndex = 6
	Instance.new("UICorner", logoImg).CornerRadius = UDim.new(1, 0)

	local rankLabel = Instance.new("TextLabel")
	rankLabel.Name = "DisplayName"
	rankLabel.Parent = bg
	rankLabel.Size = UDim2.new(1, -(TEXT_OFFSET + 10), 0, math.floor(tagHeight * 0.40))
	rankLabel.Position = UDim2.new(0, TEXT_OFFSET, 0, 6)
	rankLabel.BackgroundTransparency = 1
	rankLabel.Text = displayName
	rankLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	rankLabel.TextScaled = true
	rankLabel.TextXAlignment = Enum.TextXAlignment.Left
	rankLabel.Font = Enum.Font.LuckiestGuy
	rankLabel.TextStrokeTransparency = 0.45
	rankLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	rankLabel.ZIndex = 7

	local userLabel = Instance.new("TextLabel")
	userLabel.Name = "Username"
	userLabel.Parent = bg
	userLabel.Size = UDim2.new(1, -(TEXT_OFFSET + 10), 0, math.floor(tagHeight * 0.28))
	userLabel.Position = UDim2.new(0, TEXT_OFFSET, 0.55, 0)
	userLabel.BackgroundTransparency = 1
	userLabel.Text = "@" .. plr.Name
	userLabel.TextColor3 = Color3.fromRGB(210, 210, 210)
	userLabel.TextScaled = true
	userLabel.TextXAlignment = Enum.TextXAlignment.Left
	userLabel.Font = Enum.Font.Gotham
	userLabel.TextStrokeTransparency = 0.75
	userLabel.ZIndex = 7

	if resolvedRankEffect == "typing" then
		startTypingEffect(rankLabel, displayName)
	end

	local isZoomed = false
	local t0 = tick()
	local connection
	connection = runSvc.Heartbeat:Connect(function()
		if not bb or not bb.Parent then
			connection:Disconnect()
			return
		end

		if not hd or not hd.Parent then
			local newHead = plr.Character and plr.Character:FindFirstChild("Head")
			if newHead then
				hd = newHead
				bb.Adornee = newHead
			end
		end

		local t = tick() - t0
		local floatY = math.sin(t * CONFIG.FloatSpeed) * CONFIG.FloatAmplitude
		bb.StudsOffset = currentTagOff + Vector3.new(0, floatY, 0)
		stroke.Transparency = 0.35 + 0.15 * math.sin(t * 2.2)

		local camera = workspace.CurrentCamera
		if camera and hd and hd.Parent then
			local dist = (camera.CFrame.Position - hd.Position).Magnitude
			if dist > ZOOMOUT_DISTANCE and not isZoomed then
				isZoomed = true
				tweenSvc:Create(bb, TweenInfo.new(0.12), { Size = ZOOMOUT_SIZE }):Play()
				tweenSvc:Create(logoHolder, TweenInfo.new(0.12), {
					Position = UDim2.new(0.5, -ZOOMOUT_SIZE.Y.Offset / 2, 0.5, -ZOOMOUT_SIZE.Y.Offset / 2),
					Size = UDim2.new(0, ZOOMOUT_SIZE.Y.Offset, 0, ZOOMOUT_SIZE.Y.Offset),
				}):Play()
				rankLabel.Visible = false
				userLabel.Visible = false
			elseif dist <= ZOOMOUT_DISTANCE and isZoomed then
				isZoomed = false
				tweenSvc:Create(bb, TweenInfo.new(0.12), { Size = currentTagSize }):Play()
				tweenSvc:Create(logoHolder, TweenInfo.new(0.12), {
					Position = UDim2.new(0, IMG_PAD, 0.5, -IMG_W / 2),
					Size = UDim2.new(0, IMG_W, 0, IMG_W),
				}):Play()
				rankLabel.Visible = true
				userLabel.Visible = true
			end
		end
	end)
end

local function refreshActiveUsers()
	local list = api("GET", "/active")
	if type(list) ~= "table" then return end
	local newMutual = {}
	for _, id in ipairs(list) do
		newMutual[tonumber(id)] = true
	end
	newMutual[lp.UserId] = true
	mutualPlrs = newMutual
	for _, plr in pairs(plrs:GetPlayers()) do
		if mutualPlrs[plr.UserId] and not taggedPlrs[plr.UserId] then
			if plr.Character and plr.Character:FindFirstChild("Head") then
				task.spawn(buildTag, plr)
			end
		end
	end
end

-- ===================== START =====================
registerSelf()

task.spawn(function()
	while true do
		task.wait(60)
		registerSelf()
	end
end)

task.spawn(function()
	while true do
		refreshActiveUsers()
		task.wait(12)
	end
end)

local function onCharacter(plr)
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("Head", 5)
		task.wait(0.5)
		if mutualPlrs[plr.UserId] then
			buildTag(plr)
		end
	end)
end

for _, plr in pairs(plrs:GetPlayers()) do
	onCharacter(plr)
end
plrs.PlayerAdded:Connect(onCharacter)

plrs.PlayerRemoving:Connect(function(plr)
	taggedPlrs[plr.UserId] = nil
	mutualPlrs[plr.UserId] = nil
	removeUser(plr.UserId)
	local pg = lp:FindFirstChild("PlayerGui")
	if pg then
		local tag = pg:FindFirstChild("NEMESISTag_" .. plr.UserId)
		if tag then tag:Destroy() end
	end
end)

mutualPlrs[lp.UserId] = true
task.wait(1)
if lp.Character then
	buildTag(lp)
end
