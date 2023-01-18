local _, ns = ...
local AelwiUI = ns.AelwiUI

function AelwiUI:UnitFrames()
	local posPerFrame = {
		['PetFrame']					= {'CENTER', PlayerFrame, 'CENTER',  -60,  55},	
		['PlayerFrame']					= {'CENTER', UIParent, 	  'CENTER', -400, 400},
		['TargetFrame']					= {'CENTER', PlayerFrame, 'CENTER',  100, -50},
		['FocusFrame']					= {'CENTER', UIParent, 	  'CENTER',  350,  50},
		['TargetFrameToT']				= {'CENTER', TargetFrame, 'CENTER',   60, -37},
		['FocusFrameToT']				= {'CENTER', FocusFrame,  'CENTER',   60, -37},
		['MinimapCluster']				= {'CENTER', UIParent,	  'CENTER',  500, 300},
		['TargetFrameNumericalThreat'] 	= {'TOP',	 PlayerFrame, 'TOP',      80,  -3},
	}
	
	for frame,pos in pairs(posPerFrame) do
		_G[frame]:ClearAllPoints()
		_G[frame]:SetPoint(unpack(pos))

		if _G[frame]:IsMovable() then
			_G[frame]:SetUserPlaced(true)
		end

		UIPARENT_MANAGED_FRAME_POSITIONS[frame] = nil
	end

	hooksecurefunc(MasterLooterFrame, 'Hide', function(self) 
		self:ClearAllPoints() 
	end)

	for _,v in pairs({
		PlayerFrame,
		TargetFrame,
		ComboFrame,
		FocusFrame,
		CastingBarFrame,
		PetCastingBarFrame,
	}) do
		v:SetScale(0.9)
	end

	for _,v in pairs({
		'UNIT_ENTERING_VEHICLE',
		'UNIT_ENTERED_VEHICLE',
		'UNIT_EXITING_VEHICLE',
		'UNIT_EXITED_VEHICLE'
	}) do
		PlayerFrame:UnregisterEvent(v)
	end

	for _,v in pairs({
		PlayerName,
		PlayerLevelText,

		PetName,

		TargetFrame.name,
		TargetFrame.levelText,
		TargetFrameToT.name,

		FocusFrame.name,
		FocusFrame.levelText,
		FocusFrameToT.name,

		PartyMemberFrame1Name,
		PartyMemberFrame2Name,
		PartyMemberFrame3Name,
		PartyMemberFrame4Name,
	}) do
		v.__SetVertexColor = v.SetVertexColor
		hooksecurefunc(v,'SetVertexColor',function(self)
			self:__SetVertexColor(1,1,1,1)
		end)
		v:SetTextColor(1,1,1,1)
		-- v:SetFont(AelwiUI.texturePath..'font.ttf',13)
	end

	for _,v in pairs({
		TotemFrame,
		RuneFrame
	}) do
		v.__SetPoint = v.SetPoint
		hooksecurefunc(v,'SetPoint',function(self)
			self:ClearAllPoints()
			self:__SetPoint('BOTTOM',PlayerFrame,'TOP',55,0)

			if v == TotemFrame then
				for i = 1, 4 do
					_G['TotemFrameTotem'..i..'Duration']:ClearAllPoints()
					_G['TotemFrameTotem'..i..'Duration']:SetPoint('BOTTOM',_G['TotemFrameTotem'..i],'TOP',0,0)
				end
			end
		end)
		v:SetPoint('CENTER')
	end

	GameTooltip:HookScript('OnTooltipSetUnit',function(self)
		local _,unit = self:GetUnit()

		if not unit then
			return
		end

		GameTooltip:AddLine(UnitName(unit..'target'))
	end)

	hooksecurefunc('PlayerFrame_ToPlayerArt',function(self)
		PlayerFrameTexture:SetTexture('Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite')
	end)
			
	-- local function updateUnitArt()
	-- 	for _,v in pairs({
	-- 		PlayerFrameHealthBar,
	-- 		TargetFrameHealthBar,
	-- 		FocusFrameHealthBar,
	-- 	}) do
	-- 		v:SetHeight(16)

	-- 		v.TextString:ClearAllPoints()
	-- 		v.TextString:SetPoint('CENTER',v)
	-- 	end
			
	-- 	for _,v in pairs({
	-- 		PlayerFrameManaBar,
	-- 		TargetFrameManaBar,
	-- 		FocusFrameManaBar,
	-- 	}) do
	-- 		v:ClearAllPoints()
	-- 		v:SetPoint('TOPLEFT', v.unit == 'player' and 106 or 5, -58)
	-- 		v:SetHeight(4)

	-- 		v.TextString:ClearAllPoints()
	-- 		v.TextString:SetPoint('CENTER',v)
	-- 	end
			
	-- 	for _,v in pairs({
	-- 		TargetFrameTextureFrameTexture,
	-- 		FocusFrameTextureFrameTexture,
	-- 	}) do
	-- 		v:SetTexture(AelwiUI.texturePath..'UI-TargetingFrame')
	-- 	end

	-- 	PlayerFrameTexture:SetTexture(AelwiUI.texturePath..'UI-TargetingFrame-Rare-Elite')
	-- end
	-- hooksecurefunc('PlayerFrame_ToPlayerArt',updateUnitArt)

	-- for _,v in pairs({
	-- 	PlayerFrame,
	-- 	TargetFrame,
	-- 	FocusFrame
	-- }) do
	-- 	v.healthbar.TextString:ClearAllPoints()
	-- 	v.manabar.TextString:ClearAllPoints()

	-- 	v.healthbar.TextString:SetPoint('CENTER',v.healthbar)
	-- 	v.manabar.TextString:SetPoint('CENTER',v.manabar)
	-- end

	-- hooksecurefunc('TargetFrame_CheckClassification', function(self, forceNormalTexture)  	
	-- 	local texture
	-- 	local classification = UnitClassification(self.unit)
		
	-- 	if classification == 'worldboss' or classification == 'elite' then  
	-- 		texture = AelwiUI.texturePath..'UI-TargetingFrame-Elite'
	-- 	elseif classification == 'rareelite' then                  
	-- 		texture = AelwiUI.texturePath..'UI-TargetingFrame-Rare-Elite'
	-- 	elseif classification == 'rare' then 
	-- 		texture = AelwiUI.texturePath..'UI-TargetingFrame-Rare'
	-- 	elseif classification == 'normal' then
	-- 		texture = AelwiUI.texturePath..'UI-TargetingFrame'
	-- 	end

	-- 	if texture then 
	-- 		self.borderTexture:SetTexture(texture) 
	-- 	end
	-- end)
		
	local function fixValue(v)
		if v >= 1e6 then
			return ('%.1fm'):format(v/1e6):gsub('%.?0+([km])$','%1')
		elseif v >= 1e4 then 
			return ('%.1fk'):format(v/1e3):gsub('%.?0+([km])$','%1') 
		else 
			return v
		end 
	end

	hooksecurefunc('TextStatusBar_UpdateTextString',function(self)
		if self.TextString and self.currValue then
			self.TextString:SetText(fixValue(self.currValue))
		end
	end)

	-- local colour = RAID_CLASS_COLORS[AelwiUI.pClass]
	-- PlayerFrame.bg = PlayerFrame:CreateTexture()
	-- PlayerFrame.bg:SetPoint('TOPLEFT', PlayerFrameBackground)
	-- PlayerFrame.bg:SetPoint('BOTTOMRIGHT', PlayerFrameBackground, 0, 22)
	-- PlayerFrame.bg:SetTexture('Interface\\TargetingFrame\\UI-StatusBar')
	-- PlayerFrame.bg:SetVertexColor(colour.r, colour.g, colour.b, 1)
	
	-- local function colorStatusBar(statusbar, unit)
	-- 	if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
	-- 		local _, class = UnitClass(unit)
	-- 		local c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]

	-- 		statusbar:SetStatusBarColor(c.r, c.g, c.b)
	-- 	end
	-- end
	
	-- hooksecurefunc('UnitFrameHealthBar_Update', colorStatusBar)
	-- hooksecurefunc('HealthBar_OnValueChanged', function(self)
	-- 	colorStatusBar(self, self.unit)
	-- end)

	-- hooksecurefunc('TargetFrame_CheckFaction',function(self)
	-- 	if UnitIsPlayer(self.unit) and UnitIsConnected(self.unit) and UnitClass(self.unit) then
	-- 		local _, class = UnitClass(self.unit)
	-- 		local c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
			
	-- 		self.nameBackground:SetVertexColor(c.r, c.g, c.b)
	-- 	end
	-- end)
	
	local CTT = CreateFrame('Frame', 'TargetCombatIndicator', TargetFrame)
	CTT:SetPoint('RIGHT', TargetFrame, 2, 5)

	local CFT = CreateFrame('Frame', 'FocusCombatIndicator', FocusFrame)
	CFT:SetPoint('LEFT', FocusFrame, -30, 5)

	local frames = {
		target = {CTT, 'PLAYER_TARGET_CHANGED'},
		focus = {CFT, 'PLAYER_FOCUS_CHANGED'},
	}

	for k, v in pairs(frames) do
		local frame = v[1]
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Hide()
		
		frame.icon = frame:CreateTexture(nil, 'BORDER')
		frame.icon:SetAllPoints()
		frame.icon:SetTexture('Interface\\Icons\\ABILITY_DUALWIELD')
		frame.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		frame.icon:SetPoint('TOPLEFT', 1, -1)
		frame.icon:SetPoint('BOTTOMRIGHT', -1, 1)	

		frame.border = frame:CreateTexture(nil, 'OVERLAY')
		frame.border:ClearAllPoints()
		frame.border:SetAllPoints(frame)
		frame.border:SetTexture(AelwiUI.texturePath..'border')
		frame.border:SetVertexColor(.3, .3, .3)

		frame:SetScript('OnEvent', function(self, event, unit)
			if unit == k or event == v[2] then
				self[UnitAffectingCombat(k) and 'Show' or 'Hide'](self)
			end
		end)
		
		frame:RegisterEvent('UNIT_FLAGS')
		frame:RegisterEvent(v[2])
	end
			
	for _,v in pairs({
		CastingBarFrame,
		TargetFrameSpellBar,
		FocusFrameSpellBar
	}) do
		v:SetStatusBarColor(0,0.45,0.9)
		v.__SetStatusBarColor = v.SetStatusBarColor
		hooksecurefunc(v,'SetStatusBarColor',function(self)
			v:__SetStatusBarColor(0,0.45,0.9)
		end)
	end
	
	for _,v in pairs({
		PetName,
		PlayerPVPIcon,
		PlayerFrameGroupIndicator,
		TargetFrameTextureFramePVPIcon,
		FocusFrameTextureFramePVPIcon,
	}) do
		v:SetAlpha(0)
	end

	hooksecurefunc('UnitFrameManaBar_UpdateType',function(self)
		if UnitPowerType(self.unit) == 0 then
			self:SetStatusBarColor(0, .55, 1)
		end
	end)

	hooksecurefunc('CompactUnitFrame_UpdatePowerColor',function(self)
		if not self.powerBar then
			return
		end

		if UnitPowerType(self.unit) == 0 then
			self.powerBar:SetStatusBarColor(0, .55, 1)
		end
	end)
end