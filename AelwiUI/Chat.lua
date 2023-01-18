local _, ns = ...
local AelwiUI = ns.AelwiUI

function AelwiUI:Chat()
	local function skinChat(index)
		if _G['ChatFrame'..index].styled then
			return
		end

		_G['ChatFrame'..index]:SetClampedToScreen(false)

		for _,v in pairs({select(3,_G['ChatFrame'..index..'EditBox']:GetRegions())}) do
			if v:GetObjectType() == 'Texture' then
				v:SetTexture(nil)
			end
		end
		
		for _,v in pairs({_G['ChatFrame'..index..'Tab']:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetTexture(nil)
			end
		end

		for _,v in pairs({_G['ChatFrame'..index..'ButtonFrame']:GetChildren()}) do
			v:Hide()
		end
	
		for g = 2,#CHAT_FRAME_TEXTURES do
			_G['ChatFrame'..index..CHAT_FRAME_TEXTURES[g]]:SetTexture(nil)
		end

		_G['ChatFrame'..index].styled = true
	end

	for _,v in pairs({
		ChatFrameChannelButton,
		ChatFrameMenuButton
	}) do
		v:Hide()
		v:SetAlpha(0)
	end

	for i=1,NUM_CHAT_WINDOWS do
		skinChat(i)
	end

	hooksecurefunc('FCF_SetWindowName',function(frame)
		skinChat(frame:GetID())
	end)

	hooksecurefunc('FCF_OpenTemporaryWindow',function()
		local frame = FCF_GetCurrentChatFrame()

		skinChat(frame:GetID())
	end)

	BNToastFrame.__SetPoint = BNToastFrame.SetPoint
	hooksecurefunc(BNToastFrame,'SetPoint',function(self)
		self:ClearAllPoints()
		self:__SetPoint('LEFT',UIParent,'LEFT',10,0)
	end)
end
