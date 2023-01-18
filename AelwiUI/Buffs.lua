local _, ns = ...
local AelwiUI = ns.AelwiUI
local ABG = LibStub('LibButtonGlow-1.0')
local showOverlay = ABG.ShowOverlayGlow
local hideOverlay = ABG.HideOverlayGlow

function AelwiUI:Buffs()
	for _,v in pairs({
		BuffFrame,
		TemporaryEnchantFrame
	}) do
		v:SetScale(.9)
	end

	-- BuffFrame.__SetPoint = BuffFrame.SetPoint
	-- hooksecurefunc(BuffFrame,'SetPoint',function(self)
	-- 	self:ClearAllPoints()
	-- 	self:__SetPoint('BOTTOMRIGHT',TargetFrame,'TOPRIGHT',-100,200)
	-- end)

	-- BuffFrame:SetScript('OnUpdate', nil)
	-- hooksecurefunc(BuffFrame, 'Show', function(self)
	--     self:SetScript('OnUpdate', nil)
	-- end)

	-- for _,v in pairs({
	-- 	'TargetFrame_UpdateBuffAnchor',
	-- 	'TargetFrame_UpdateDebuffAnchor'
	-- }) do
	-- 	hooksecurefunc(v, function(_, name, i)
	-- 		_G[name..i]:SetSize(22, 22)
	-- 	end)
	-- end

	local function durationSetText(duration, arg1, arg2)
		duration:SetText(format(string.gsub(arg1, ' ', ''), arg2))
	end

	local function skinAura(aura)
		if aura and not aura.styled then
			local name = aura:GetName()
			local border = _G[name..'Border']
			local icon = aura.icon or _G[name..'Icon']
			local count = aura.count or _G[name..'Count']
			local duration = aura.duration or _G[name..'Duration']

			if icon then
				icon:SetPoint('TOPLEFT', 1, -1)
				icon:SetPoint('BOTTOMRIGHT', -1, 1)	
			end

			if count then
				-- count:ClearAllPoints()
				-- count:SetPoint('TOP')
				count:SetDrawLayer('OVERLAY')
			end	

			-- if duration then
			-- 	duration:ClearAllPoints()
			-- 	duration:SetPoint('BOTTOM',0,-2)
			-- 	duration:SetFont('Interface\\AddOns\\tekticles\\CalibriBold.ttf',10,'OUTLINE')
			-- 	duration:SetDrawLayer('OVERLAY')

			-- 	hooksecurefunc(duration, 'SetFormattedText', durationSetText)
			-- end
			
			if border then
				border:SetTexture(AelwiUI.texturePath..'border')
				border:SetTexCoord(0, 1, 0, 1)
				border:ClearAllPoints()
				border:SetAllPoints(aura)
			else
				border = aura:CreateTexture(nil, 'OVERLAY')
				border:ClearAllPoints()
				border:SetAllPoints(aura)
				border:SetTexture(AelwiUI.texturePath..'border')
				border:SetVertexColor(.7, .7, .7)
			end	

			if name:match('TempEnchant') then
				border:SetTexture(AelwiUI.texturePath..'temp')
				border:SetVertexColor(0.7,0,1)
			end	

			aura.styled = true		
		end 
	end

	hooksecurefunc('TargetFrame_UpdateAuras', function(self)
		if self.unit == 'target' then
			for i = 1, MAX_TARGET_BUFFS do
				skinAura( _G['TargetFrameBuff'..i])
			end

			for i = 1, MAX_TARGET_DEBUFFS do
				skinAura(_G['TargetFrameDebuff'..i])
			end
		elseif self.unit == 'focus' then
			for i = 1, MAX_TARGET_BUFFS do
				skinAura(_G['FocusFrameBuff'..i])
			end

			for i = 1, MAX_TARGET_DEBUFFS do
				skinAura(_G['FocusFrameDebuff'..i])
			end
		end

		for i = 1 ,MAX_TARGET_BUFFS do
			local _, _, _, buffType = UnitAura(self.unit, i)
			local buff = _G[self:GetName()..'Buff'..i]

			if buffType == 'Magic' then
				_G[buff:GetName()..'Stealable']:Show()
			end
		end
	end)
	
	local function skinCastbar(castBar)
		if not castBar or castBar.styled then 
			return 
		end

		local icon = castBar.Icon
		icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		local border = castBar:CreateTexture(nil, 'BACKGROUND')
		border:SetTexture(AelwiUI.texturePath..'border')
		border:SetTexCoord(0, 1, 0, 1)
		border:SetDrawLayer('BACKGROUND',- 7)
		border:SetVertexColor(0, 0, 0)
		border:ClearAllPoints()
		border:SetPoint('TOPLEFT', icon, 'TOPLEFT', -2, 2)
		border:SetPoint('BOTTOMRIGHT', icon, 'BOTTOMRIGHT', 2, -2)

		castBar.styled = true
	end
	
	skinCastbar(TargetFrameSpellBar)
	skinCastbar(FocusFrameSpellBar)

	local function updateDebuffAnchors(buttonName,index)
		local button = _G[buttonName..index]
		
		if not button then 
			return 
		end

		if not button.styled then 
			skinAura(button) 
		end
	end

	local function updateAllBuffAnchors()
		for index = 1, BUFF_MAX_DISPLAY  do
			local button = _G['BuffButton'..index]

			if not button then 
				return 
			end

			if not button.styled then 
				skinAura(button)
			end
		end
	end

	skinAura(TempEnchant1)
	skinAura(TempEnchant2)

	hooksecurefunc('BuffFrame_UpdateAllBuffAnchors', updateAllBuffAnchors)
	hooksecurefunc('DebuffButton_UpdateAnchors', updateDebuffAnchors)
end
