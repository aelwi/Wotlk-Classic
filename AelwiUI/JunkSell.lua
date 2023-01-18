local _, ns = ...
local AelwiUI = ns.AelwiUI

function AelwiUI:JunkSell()
	local JunkValue = 0

	local GetContainerItemLink = C_Container.GetContainerItemLink
	local GetContainerNumSlots = C_Container.GetContainerNumSlots
	local GetContainerItemInfo = C_Container.GetContainerItemInfo
	local PickupContainerItem = C_Container.PickupContainerItem

	local function IsJunk(bag, slot)
		local link = GetContainerItemLink(bag, slot)
		
		if link then 
			link = link:gsub('%d+:%d+|', '0:0|') 
		else 
			return 
		end
		
		return link:match(ITEM_QUALITY_COLORS[0].hex)
	end

	local function SellJunk()
		for bag=0,4 do
			if GetContainerNumSlots(bag) then
				for slot=1,GetContainerNumSlots(bag) do
					if IsJunk(bag, slot) then
						local tbl = GetContainerItemInfo(bag, slot)
						local count = tbl.stackCount

						DEFAULT_CHAT_FRAME:AddMessage('|cff4fff4fSelling junk|r: ' .. (count > 1 and count .. 'x' or '') .. GetContainerItemLink(bag,slot))
						
						PickupContainerItem(bag,slot)
						PickupMerchantItem(MerchantFrame:GetID())
					end
				end
			end
		end
	end

	local function GetJunkValue()
		JunkValue = 0
		
		for bag=0,4 do
			if GetContainerNumSlots(bag) then
				for slot=1,GetContainerNumSlots(bag) do
					if IsJunk(bag, slot) then 
						JunkTooltip:SetBagItem(bag,slot) 
					end
				end
			end
		end
	end

	local JunkTooltip = CreateFrame('GameTooltip', 'JunkTooltip', nil, 'GameTooltipTemplate')
	JunkTooltip:SetScript('OnTooltipAddMoney', function(_,price)
		if price then 
			JunkValue = JunkValue + price 
		end 
	end)

	local JunkButton = CreateFrame('Button', 'JunkButton', MerchantBuyBackItem)
	JunkButton:SetWidth(32)
	JunkButton:SetHeight(32)
	JunkButton:SetPoint('TOPRIGHT', MerchantFrame, 'TOPRIGHT', -10, -28)
	
	local function JunkButtonUpdate()
		GetJunkValue()
		if JunkValue > 0 then 
			JunkButton:Enable()
		else 
			JunkButton:Disable()
		end
	end
	
	JunkButton:SetScript('OnShow', JunkButtonUpdate)
	JunkButton:SetScript('OnEnter', function()
		GetJunkValue()
		
		GameTooltip:SetOwner(JunkButton, 'ANCHOR_RIGHT', 0, -32)
		GameTooltip:SetText('Sell your junk')
		GameTooltip:AddLine('You will receive', 1, 1, 1)
		
		if JunkValue > 0 then 
			SetTooltipMoney(GameTooltip, JunkValue)
		else 
			GameTooltip:AddLine('You\'ve got no junk!')
		end
		GameTooltip:Show()
	end)
	
	JunkButton:SetScript('OnLeave', function() 
		GameTooltip:Hide() 
		JunkValue = 0 
	end)
	
	JunkButton:SetScript('OnClick', SellJunk)
	JunkButton:RegisterEvent('BAG_UPDATE')
	
	JunkButton:SetScript('OnEvent', function() 
		if not JunkButton:IsVisible() then 
			return 
		end 
		
		JunkButtonUpdate() 
	end)
	
	JunkButton:SetNormalTexture('Interface\\Icons\\inv_misc_coin_01')
	JunkButton:SetHighlightTexture('Interface\\Buttons\\ButtonHilight-Square')
	JunkButton:SetPushedTexture('Interface\\Icons\\inv_misc_coin_01')
	JunkButton:SetDisabledTexture('Interface\\Icons\\spell_chargenegative')

	JunkTooltip:RegisterEvent('MERCHANT_SHOW')
	JunkTooltip:SetScript('OnEvent', SellJunk)
end
