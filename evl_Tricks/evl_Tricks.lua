local _,playerClass = UnitClass('player')
local spellID

if playerClass == 'ROGUE' then
	spellID = 57934
elseif playerClass == 'HUNTER' then
	spellID = 34477
else
	return
end

local spellName,_,spellTexture = GetSpellInfo(spellID)

evl_TricksDB = evl_TricksDB or {}

local db = evl_TricksDB
local targets = {"Primary", "Secondary", "Tertiary"}
local macroName = "Evl's Tricks"

local frame = CreateFrame("Frame", nil, UIParent)
frame:SetPoint("BOTTOMLEFT", GeneralDockManager, "TOPLEFT", 3, 0)
frame:SetPoint("RIGHT", GeneralDockManager)
frame:SetHeight(10)

local display = frame:CreateFontString(nil, "OVERLAY")
display:SetPoint("LEFT", frame)
display:SetShadowOffset(0.7, -0.7)
display:SetFont(STANDARD_TEXT_FONT, 16)

local function generateMacro()
	if InCombatLockdown() then
		frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	else
		frame:UnregisterEvent("PLAYER_REGEN_ENABLED")
	
		local body = "#showtooltip "..spellName.."\n/cast "
		local text
	
		for _, target in pairs(targets) do
			local name = db[target]

			if name then
				local _, classId = UnitClass(name)

				if classId then
					local color = RAID_CLASS_COLORS[classId]

					body = body .. format("[@%s] "..spellName, name)
					text = (text and text .. ", " or "") .. format("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, name)
				end
			end
		end

		local index = GetMacroIndexByName(macroName)

		if index > 0 then
			EditMacro(index, macroName, spellTexture, body, false)
		else
			index = CreateMacro(macroName, spellTexture, body, false)
			PickupMacro(index)

			print(format("Tricks: Created new macro '%s'", macroName))
		end
		
		display:SetText(text and text or "")
	end
end

frame:SetScript("OnEvent", generateMacro)
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("RAID_ROSTER_UPDATE")

function EvlTricks_Set(target)
	local unit = "target"
	local previousName = db[target]
	
	if not UnitExists(unit) then
		if previousName then
			db[target] = nil
			generateMacro()

			print(format("Tricks: Cleared %s target (%s)", target:lower(), previousName))
		else
			print("Tricks: No target selected")
		end
	elseif not UnitInParty(unit) and not UnitInRaid(unit) then
		print("Tricks: Target must be a player in your party/raid")
	else
		local name = UnitName(unit)
		
		if previousName == name then
			print(format("Tricks: %s is already your %s target", name, target))
		else
			for _, existingTarget in pairs(targets) do
				if db[existingTarget] == name then
					db[existingTarget] = nil
				end
			end
		end
		
		-- Make sure the target isn't already set as another priority
		for _, existingTarget in pairs(targets) do
			if db[existingTarget] == name then
				db[existingTarget] = nil
			end
		end

		db[target] = name
		generateMacro()
		
		--SendChatMessage("You're getting my Tricks of the Trade!", "WHISPER", nil, name)
		
		print(format("Tricks: %s target is now %s", target, name))
	end
end
