loadstring(game:HttpGet("https://raw.githubusercontent.com/ykknzo-hub/notid/refs/heads/main/notfications.lua"))()
loadstring(game:HttpGet("https://pastebin.com/raw/YJcEqR83"))()

local HttpService = game:GetService("HttpService")
local plrs = game:GetService("Players")
local tweenSvc = game:GetService("TweenService")
local runSvc = game:GetService("RunService")
local soundSvc = game:GetService("SoundService")
local lp = plrs.LocalPlayer

-- ====================== FIREBASE ONLY ======================
local NEMESIS_PRESENCE_URL = "https://nemesis-a081f-default-rtdb.europe-west1.firebasedatabase.app/nemesis_presence"
local PRESENCE_TIMEOUT = 5          -- seconds without update = offline
local REFRESH_INTERVAL = 1           -- how often we check who is online
local KEEP_ALIVE_INTERVAL = 1       -- how often we update our own presence
-- ===========================================================

local JSON_URL = "https://raw.githubusercontent.com/ykknzo-hub/commandlist/refs/heads/main/nemesis%20cmd/tags.json"
local MAX_RETRIES = 3
local GRADIENT_COLOR_A = Color3.fromRGB(90, 180, 255)
local GRADIENT_COLOR_B = Color3.fromRGB(245, 250, 255)
local TP_SOUND_ID = 135640489101126

local getasset = getcustomasset or getsynasset or (getgenv and (getgenv().getcustomasset or getgenv().getsynasset))

local THEMES = {
	purple = { Color3.fromRGB(150, 60, 255), Color3.fromRGB(255, 150, 255) },
	gold = { Color3.fromRGB(255, 180, 20), Color3.fromRGB(255, 255, 180) },
	cyan = { Color3.fromRGB(90, 180, 255), Color3.fromRGB(245, 250, 255) },
	fire = { Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 230, 50) },
	bw = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0) },
	red = { Color3.fromRGB(200, 0, 0), Color3.fromRGB(0, 0, 0) },
}

local CONFIG = {
	RankText = "NEMESIS USER",
	Theme = "bw",
	ShimmerEnabled = true,
	PulseEnabled = true,
	RainbowRankEnabled = false,
	FloatAmplitude = 0.08,
	FloatSpeed = 1.4,
	RankEffect = "typing",
	LogoSizeMultiplier = 0.8,
	LogoPadding = 6,
	TextAlignment = "Left",
}

local DEFAULT_TAG_WIDTH = 180
local DEFAULT_TAG_HEIGHT = 50
local DEFAULT_TAG_OFFSET_Y = 1.9 
local TAG_CORNER = UDim.new(0, 14)
local LOGO_FILE = "whitelogo.png"
local LOGO_URL = "https://i.ibb.co/SwGkMS5h/whitelogo.png"

local ROLE_PRESETS = {
	["DEV"] = {
		gradientA  = Color3.fromRGB(173, 216, 230),
		gradientB  = Color3.fromRGB(173, 216, 230),
		rankEffect = "",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
		logoAsset  = "1f346.png",
		logoURL    = "https://cdn.discordapp.com/attachments/1493961870548144131/1539422380420501504/1f346.png?ex=6a864250&is=6a84f0d0&hm=c4695992b128cd7065274da90caec626d70e0b8ae6b967001cbfaeb67141d916&",
		useAnimatedBg = false,
		spriteFile   = "",
		spriteURL    = "",
		frameColumns = 5,
		frameRows    = 4,
		totalFrames  = 15,
		framesPerSec = 10,
		staticBgFile = "tojipfp.png",
		staticBgURL  = "https://cdn.discordapp.com/attachments/1493961870548144131/1539427008352755913/tojipfp.png?ex=6a86469f&is=6a84f51f&hm=3165dec2b209bf1812cd9bdaf49578ebf5d67f6cfa808b117dc8e1e876b18519&",
		textAlignment = "Left",
	},
	["ANGEL"] = {
		gradientA  = Color3.fromRGB(255, 255, 255),
		gradientB  = Color3.fromRGB(0, 0, 0),
		rankEffect = "typing",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
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
		textAlignment = "Left",
	},
	["OWNER"] = {
		gradientA  = Color3.fromRGB(255, 255, 255),
		gradientB  = Color3.fromRGB(0, 0, 0),
		rankEffect = "typing",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
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
		textAlignment = "Left",
	},
	["ᴘᴀᴘᴀ ᴄʜʀᴏɴ"] = {
		gradientA  = Color3.fromRGB(0, 0, 0),
		gradientB  = Color3.fromRGB(255, 255, 255),
		rankEffect = "typing",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
		logoAsset  = "",
		logoURL    = "",
		useAnimatedBg = false,
		spriteFile   = "chrontagv2.png",
		spriteURL    = "https://i.ibb.co/Hf20kTQv/chrontagv2.png",
		frameColumns = 5,
		frameRows    = 4,
		totalFrames  = 20,
		framesPerSec = 5,
		staticBgFile = "chrontagv2.png",
		staticBgURL  = "https://i.ibb.co/Hf20kTQv/chrontagv2.png",
		textAlignment = "Left",
	},
	["CHRON OWNS ME"] = {
		gradientA  = Color3.fromRGB(0, 0, 0),
		gradientB  = Color3.fromRGB(255, 255, 255),
		rankEffect = "typing",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
		logoAsset  = "",
		logoURL    = "",
		useAnimatedBg = true,
		spriteFile   = "chronsgirltag.png",
		spriteURL    = "https://i.ibb.co/jPP2G95m/chronsgirltag.png",
		frameColumns = 5,
		frameRows    = 4,
		totalFrames  = 20,
		framesPerSec = 5,
		textAlignment = "Left",
	},
	["eetxn"] = {
		gradientA  = Color3.fromRGB(173, 216, 230),
		gradientB  = Color3.fromRGB(173, 216, 230),
		rankEffect = "",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
		logoAsset  = "",
		logoURL    = "",
		useAnimatedBg = true,
		spriteFile   = "downloadddd.png",
		spriteURL    = "https://i.ibb.co/Ndsh7W9V/downloadddd.png",
		frameColumns = 5,
		frameRows    = 5,
		totalFrames  = 25,
		framesPerSec = 8,
		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
		textAlignment = "Left",
	},
	["NEMESIS STAFF"] = {
		gradientA  = Color3.fromRGB(255,255,255),
		gradientB  = Color3.fromRGB(255,255,255),
		rankEffect = "",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
		logoAsset  = "",
		logoURL    = "",
		useAnimatedBg = true,
		spriteFile   = "stafftag.png",
		spriteURL    = "https://cdn.discordapp.com/attachments/1535724160070844426/1539407226223992832/stafftag.png?ex=6a863433&is=6a84e2b3&hm=fcd45ddfcae10998bcced4a7b346e6ab3d8c404b8dffd605f0ccd16048b3f7aa&",
		frameColumns = 5,
		frameRows    = 3,
		totalFrames  = 15,
		framesPerSec = 4,
		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
		textAlignment = "Left",
	},
	["NEMESIS BOOSTER"] = {
		gradientA  = Color3.fromRGB(255,255,255),
		gradientB  = Color3.fromRGB(255,255,255),
		rankEffect = "",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
		logoAsset  = "",
		logoURL    = "",
		useAnimatedBg = true,
		spriteFile   = "booster_tag.png",
		spriteURL    = "https://cdn.discordapp.com/attachments/1535724160070844426/1539415029449891941/booster_tag.png?ex=6a863b77&is=6a84e9f7&hm=9967911153de211a068d42997a9fea42647caf7fa19d827738efceaf52d9830b&",
		frameColumns = 5,
		frameRows    = 3,
		totalFrames  = 15,
		framesPerSec = 4,
		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
		textAlignment = "Left",
	},
	["FENTEX"] = {
		gradientA  = Color3.fromRGB(255, 255, 255),
		gradientB  = Color3.fromRGB(255, 255, 255),
		rankEffect = "",
		tagWidth   = 180,
		tagHeight  = 50,
		tagOffsetY = 1.9,
		logoAsset  = "fentexlogp.png",
		logoURL    = "https://cdn.discordapp.com/attachments/1535724160070844426/1539473233382998157/fentexlogp.png?ex=6a8671ac&is=6a85202c&hm=5abf802c1b2edf5121bb6f4903ceec955856a58ff6e27e57824afb080b61fa90&",
		useAnimatedBg = true,
		spriteFile   = "Screenshot 2026-08-1.png",
		spriteURL    = "https://cdn.discordapp.com/attachments/1535724160070844426/1539389863181164607/image.png?ex=6a862407&is=6a84d287&hm=d14ee049f9ff041566e215b0f04c8a033dff0973188163491feb0624c475f234&",
		frameColumns = 5,
		frameRows    = 4,
		totalFrames  = 10,
		framesPerSec = 8,
		staticBgFile = "kikostag.png",
		staticBgURL  = "https://i.ibb.co/93CPw1vv/image.png",
		textAlignment = "Left",
	},
}

local customPlayers = {}
local taggedPlrs = {}
local registeredPlrs = {}

registeredPlrs[lp.UserId] = true

-- ====================== FIREBASE HELPERS ======================
local function firebaseRequest(method, path, body)
	local url = NEMESIS_PRESENCE_URL .. (path or "") .. ".json"
	local req = (syn and syn.request) or http_request or request or (fluxus and fluxus.request) or (http and http.request)

	if not req then
		warn("[Nemesis] No HTTP request function found")
		return nil
	end

	local success, response = pcall(function()
		return req({
			Url = url,
			Method = method,
			Headers = { ["Content-Type"] = "application/json" },
			Body = body and HttpService:JSONEncode(body) or nil
		})
	end)

	if not success or not response then return nil end

	if response.Body and response.Body ~= "null" and response.Body ~= "" then
		local ok, data = pcall(function() return HttpService:JSONDecode(response.Body) end)
		return ok and data or nil
	end
	return nil
end

local function registerSelf()
	local placeId = game.PlaceId
	local jobId = game.JobId
	local gameName = "Unknown"
	pcall(function()
		gameName = game:GetService("MarketplaceService"):GetProductInfo(placeId).Name
	end)

	firebaseRequest("PUT", "/" .. tostring(lp.UserId), {
		userId = lp.UserId,
		username = lp.Name,
		displayName = lp.DisplayName,
		placeId = placeId,
		jobId = jobId,
		gameName = gameName,
		updatedAt = os.time()
	})
end

local function destroyTag(userId)
	taggedPlrs[userId] = nil
	registeredPlrs[userId] = nil

	local tagName = "NEMESISTag_" .. userId

	local pg = lp:FindFirstChild("PlayerGui")
	if pg then
		local tag = pg:FindFirstChild(tagName)
		if tag then tag:Destroy() end
	end

	if typeof(gethui) == "function" then
		local okH, hui = pcall(gethui)
		if okH and hui then
			local tag = hui:FindFirstChild(tagName)
			if tag then tag:Destroy() end
		end
	end
end

local buildTag -- forward declaration

local function refreshActiveUsers()
	local data = firebaseRequest("GET")
	if type(data) ~= "table" then return end

	local now = os.time()
	local currentlyActive = {}

	for userIdStr, info in pairs(data) do
		local userId = tonumber(userIdStr)
		if userId and type(info) == "table" and info.updatedAt then
			-- Only show people who updated recently
			if (now - info.updatedAt) <= PRESENCE_TIMEOUT then
				-- Optional: uncomment next line if you only want same server
				-- if info.jobId == game.JobId then
					currentlyActive[userId] = true
					registeredPlrs[userId] = true
				-- end
			end
		end
	end

	-- Always keep ourselves
	currentlyActive[lp.UserId] = true
	registeredPlrs[lp.UserId] = true

	-- Remove tags for people who are no longer active (instant remove)
	for userId in pairs(taggedPlrs) do
		if not currentlyActive[userId] then
			destroyTag(userId)
		end
	end

	-- Build tags for newly active people (instant show)
	for _, plr in pairs(plrs:GetPlayers()) do
		if currentlyActive[plr.UserId] and not taggedPlrs[plr.UserId] then
			task.spawn(buildTag, plr)
		end
	end
end

local function forceRebuildAllTags()
	for _, plr in pairs(plrs:GetPlayers()) do
		if registeredPlrs[plr.UserId] then
			taggedPlrs[plr.UserId] = nil
			task.spawn(buildTag, plr)
		end
	end
end
-- ==============================================================

local function fetchJson(url, retries)
	for i = 1, retries do
		local success, response = pcall(function() return game:HttpGet(url) end)
		if success and response then
			local ok, decoded = pcall(function() return HttpService:JSONDecode(response) end)
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
				local preset = ROLE_PRESETS[tagTitle] or {}
				local merged = {}
				for k, v in pairs(preset) do merged[k] = v end
				merged.customName = tagTitle
				customPlayers[username] = merged
			end
		end
	end
end

local function playTpSound()
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://" .. TP_SOUND_ID
	s.Volume = 1
	s.Parent = soundSvc
	s:Play()
	s.Ended:Connect(function() s:Destroy() end)
end

local function ensureImage(file, url)
	if file and url and file ~= "" and url ~= "" and not isfile(file) then
		local success, data = pcall(game.HttpGet, game, url)
		if success and data then writefile(file, data) end
	end
end

ensureImage(LOGO_FILE, LOGO_URL)

local function loadImage(file, fallback)
	if file and file ~= "" and not isfile(file) then ensureImage(file, fallback or LOGO_URL) end
	if getasset and file and file ~= "" and isfile(file) then
		local success, result = pcall(getasset, file)
		if success then return result end
	end
	return fallback or ""
end

local function getCustomData(plr)
	return customPlayers[plr.Name] or customPlayers[plr.UserId]
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

function buildTag(plr)
	if not registeredPlrs[plr.UserId] then return end
	if not plr or not plr.Parent then return end

	local char = plr.Character
	if not char then
		char = plr.CharacterAdded:Wait()
	end
	if not char then return end

	local hd = char:FindFirstChild("Head") or char:WaitForChild("Head", 8)
	local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 8)
	if not hd or not hrp then return end

	local pg = lp:FindFirstChild("PlayerGui") or lp:WaitForChild("PlayerGui", 5)
	if not pg then return end

	local tagName = "NEMESISTag_" .. plr.UserId

	-- Destroy any existing tag
	for _, obj in pairs(pg:GetChildren()) do
		if obj.Name == tagName then obj:Destroy() end
	end
	if typeof(gethui) == "function" then
		local okH, hui = pcall(gethui)
		if okH and hui then
			local existing = hui:FindFirstChild(tagName)
			if existing then existing:Destroy() end
		end
	end

	taggedPlrs[plr.UserId] = true

	local customData = getCustomData(plr)
	local displayName = customData and customData.customName or CONFIG.RankText
	local gradA = (customData and customData.gradientA) or GRADIENT_COLOR_A
	local gradB = (customData and customData.gradientB) or GRADIENT_COLOR_B
	local tagWidth = (customData and customData.tagWidth) or DEFAULT_TAG_WIDTH
	local tagHeight = (customData and customData.tagHeight) or DEFAULT_TAG_HEIGHT
	local tagOffsetY = (customData and customData.tagOffsetY) or DEFAULT_TAG_OFFSET_Y
	local currentTagOff = Vector3.new(0, tagOffsetY, 0)
	local resolvedRankEffect = (customData and customData.rankEffect) or CONFIG.RankEffect

	local textAlignment = (customData and customData.textAlignment) or CONFIG.TextAlignment or "Left"
	local alignEnum = Enum.TextXAlignment.Left
	if textAlignment == "Center" or textAlignment == "Middle" then
		alignEnum = Enum.TextXAlignment.Center
	elseif textAlignment == "Right" then
		alignEnum = Enum.TextXAlignment.Right
	end

	local function getColors()
		if gradA and gradB then return {gradA, gradB} end
		return plr == lp and getThemeColors() or {GRADIENT_COLOR_A, GRADIENT_COLOR_B}
	end

	local finalColors = getColors()
	local SHRINK_DISTANCE = 40

	local tagParent = pg
	if typeof(gethui) == "function" then
		local okH, hui = pcall(gethui)
		if okH and hui then tagParent = hui end
	end

	local bb = Instance.new("BillboardGui")
	bb.Name = tagName
	bb.Size = UDim2.new(0, tagWidth, 0, tagHeight)
	bb.StudsOffset = currentTagOff
	bb.AlwaysOnTop = true
	bb.LightInfluence = 0
	bb.MaxDistance = math.huge
	bb.Adornee = hd
	bb.Active = true
	bb.ClipsDescendants = false
	bb.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	bb.Parent = tagParent

	local btn = Instance.new("TextButton")
	btn.Parent = bb
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.ZIndex = 50
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
	bg.Name = "TagContainer"
	bg.Parent = bb
	bg.Size = UDim2.new(1, 0, 1, 0)
	bg.BackgroundColor3 = Color3.fromRGB(15, 12, 24)
	bg.BackgroundTransparency = 0.12
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

	if customData then
		if customData.useAnimatedBg and customData.spriteFile and customData.spriteURL then
			local spriteImg = Instance.new("ImageLabel")
			spriteImg.Name = "AnimatedBg"
			spriteImg.Parent = bg
			spriteImg.Size = UDim2.new(1, 0, 1, 0)
			spriteImg.BackgroundTransparency = 1
			spriteImg.Image = loadImage(customData.spriteFile, customData.spriteURL)
			spriteImg.ScaleType = Enum.ScaleType.Crop
			spriteImg.ZIndex = 2
			Instance.new("UICorner", spriteImg).CornerRadius = TAG_CORNER

			local cols = customData.frameColumns or 1
			local rows = customData.frameRows or 1
			local total = customData.totalFrames or (cols * rows)
			local fps = customData.framesPerSec or 10

			task.spawn(function()
				local tries = 0
				while bb and bb.Parent and spriteImg.ContentImageSize.X == 0 and tries < 50 do
					task.wait(0.1)
					tries = tries + 1
				end
				if not bb or not bb.Parent then return end

				local imgWidth = spriteImg.ContentImageSize.X
				local imgHeight = spriteImg.ContentImageSize.Y
				if imgWidth == 0 or imgHeight == 0 then return end

				local frameW = imgWidth / cols
				local frameH = imgHeight / rows
				spriteImg.ImageRectSize = Vector2.new(frameW, frameH)

				local currentFrame = 0
				while bb and bb.Parent do
					local col = currentFrame % cols
					local row = math.floor(currentFrame / cols)
					spriteImg.ImageRectOffset = Vector2.new(col * frameW, row * frameH)
					currentFrame = (currentFrame + 1) % total
					task.wait(1 / fps)
				end
			end)
		elseif customData.staticBgFile and customData.staticBgURL then
			local staticImg = Instance.new("ImageLabel")
			staticImg.Name = "StaticBg"
			staticImg.Parent = bg
			staticImg.Size = UDim2.new(1, 0, 1, 0)
			staticImg.BackgroundTransparency = 1
			staticImg.Image = loadImage(customData.staticBgFile, customData.staticBgURL)
			staticImg.ScaleType = Enum.ScaleType.Crop
			staticImg.ZIndex = 2
			Instance.new("UICorner", staticImg).CornerRadius = TAG_CORNER
		end
	end

	local logoHolder = Instance.new("Frame")
	logoHolder.Parent = bg
	logoHolder.Size = UDim2.new(0.22, 0, 0.8, 0)
	logoHolder.Position = UDim2.new(0.04, 0, 0.1, 0)
	logoHolder.BackgroundTransparency = 1
	logoHolder.ZIndex = 4
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
	logoImg.ZIndex = 5
	Instance.new("UICorner", logoImg).CornerRadius = UDim.new(1, 0)

	local textSizeX, textPosX
	if alignEnum == Enum.TextXAlignment.Center then
		textSizeX = 0.92
		textPosX = 0.04
	elseif alignEnum == Enum.TextXAlignment.Right then
		textSizeX = 0.92
		textPosX = 0.04
	else
		textSizeX = 0.68
		textPosX = 0.28
	end

	local kzk = Instance.new("TextLabel")
	kzk.Name = "DisplayName"
	kzk.Parent = bg
	kzk.Size = UDim2.new(textSizeX, 0, 0.4, 0)
	kzk.Position = UDim2.new(textPosX, 0, 0.12, 0)
	kzk.BackgroundTransparency = 1
	kzk.Text = displayName
	kzk.TextColor3 = Color3.fromRGB(255, 255, 255)
	kzk.TextScaled = true
	kzk.TextXAlignment = alignEnum
	kzk.Font = Enum.Font.LuckiestGuy
	kzk.TextStrokeTransparency = 0.5
	kzk.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	kzk.ZIndex = 5

	local dname = Instance.new("TextLabel")
	dname.Name = "Username"
	dname.Parent = bg
	dname.Size = UDim2.new(textSizeX, 0, 0.3, 0)
	dname.Position = UDim2.new(textPosX, 0, 0.55, 0)
	dname.BackgroundTransparency = 1
	dname.Text = "@" .. plr.Name
	dname.TextColor3 = Color3.fromRGB(220, 220, 220)
	dname.TextScaled = true
	dname.TextXAlignment = alignEnum
	dname.Font = Enum.Font.Gotham
	dname.TextStrokeTransparency = 0.8
	dname.ZIndex = 5

	if resolvedRankEffect == "typing" then
		startTypingEffect(kzk, displayName)
	end

	local t0 = tick()
	local isSquare = false
	local connection
	connection = runSvc.Heartbeat:Connect(function()
		if not bb or not bb.Parent then
			if connection then connection:Disconnect() end
			return
		end

		if not hd or not hd.Parent then
			local newChar = plr.Character
			local newHead = newChar and newChar:FindFirstChild("Head")
			if newHead then
				hd = newHead
				char = newChar
				bb.Adornee = newHead
			else
				return
			end
		end

		local cam = workspace.CurrentCamera
		if cam and hd and hd.Parent then
			local success, dist = pcall(function()
				return (cam.CFrame.Position - hd.Position).Magnitude
			end)
			if success and dist then
				if dist >= SHRINK_DISTANCE and not isSquare then
					isSquare = true
					tweenSvc:Create(bb, TweenInfo.new(0.3), { Size = UDim2.new(0, tagHeight, 0, tagHeight) }):Play()
					tweenSvc:Create(logoHolder, TweenInfo.new(0.3), {
						Size = UDim2.new(0.8, 0, 0.8, 0),
						Position = UDim2.new(0.1, 0, 0.1, 0)
					}):Play()
					kzk.Visible = false
					dname.Visible = false
				elseif dist < SHRINK_DISTANCE and isSquare then
					isSquare = false
					tweenSvc:Create(bb, TweenInfo.new(0.3), { Size = UDim2.new(0, tagWidth, 0, tagHeight) }):Play()
					tweenSvc:Create(logoHolder, TweenInfo.new(0.3), {
						Size = UDim2.new(0.22, 0, 0.8, 0),
						Position = UDim2.new(0.04, 0, 0.1, 0)
					}):Play()
					kzk.Visible = true
					dname.Visible = true
				end
			end
		end

		local t = tick() - t0
		local floatY = math.sin(t * (CONFIG.FloatSpeed or 1.4)) * (CONFIG.FloatAmplitude or 0.08)
		bb.StudsOffset = currentTagOff + Vector3.new(0, floatY, 0)
	end)
end

-- Initial tag for yourself
task.spawn(function()
	task.wait(0.4)
	buildTag(lp)
end)

-- Register ourselves + first refresh
task.spawn(function()
	registerSelf()
	task.wait(0.8)
	refreshActiveUsers()
end)

-- Keep our presence alive
task.spawn(function()
	while true do
		task.wait(KEEP_ALIVE_INTERVAL)
		registerSelf()
	end
end)

-- Fast refresh loop (instant show/remove)
task.spawn(function()
	while true do
		task.wait(REFRESH_INTERVAL)
		refreshActiveUsers()
	end
end)

local function onCharacter(plr)
	plr.CharacterAdded:Connect(function(char)
		local head = char:WaitForChild("Head", 10)
		if not head then return end
		task.wait(0.25)

		if registeredPlrs[plr.UserId] then
			buildTag(plr)
		end

		if plr == lp then
			task.wait(0.3)
			forceRebuildAllTags()
		end
	end)

	plr.CharacterRemoving:Connect(function()
		destroyTag(plr.UserId)
	end)

	if plr.Character then
		task.spawn(function()
			local head = plr.Character:FindFirstChild("Head") or plr.Character:WaitForChild("Head", 5)
			if head and registeredPlrs[plr.UserId] then
				buildTag(plr)
			end
		end)
	end
end

for _, plr in pairs(plrs:GetPlayers()) do
	onCharacter(plr)
end
plrs.PlayerAdded:Connect(onCharacter)

plrs.PlayerRemoving:Connect(function(plr)
	destroyTag(plr.UserId)
end)

-- Clean ourselves from the database when leaving
game:BindToClose(function()
	firebaseRequest("DELETE", "/" .. tostring(lp.UserId))
end)
