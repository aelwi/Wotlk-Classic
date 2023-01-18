local _, ns = ...
local AelwiUI = CreateFrame('Frame')

function AelwiUI:Init(event)
	AelwiUI.pClass = select(2,UnitClass('player'))
	AelwiUI.textureColor = {.3,.3,.3,1}
	AelwiUI.texturePath = 'Interface\\AddOns\\AelwiUI\\textures\\'
	
	AelwiUI:Variables()
	AelwiUI:UnitFrames()
	AelwiUI:ActionBars()
	AelwiUI:Buffs()
	AelwiUI:Color()
	AelwiUI:Minimap()
	AelwiUI:Chat()
	AelwiUI:JunkSell()
	AelwiUI:MuteSounds()
	AelwiUI:Nameplate()

	SlashCmdList['RELOAD'] = function() 
		ReloadUI() 
	end
	SLASH_RELOAD1 = '/rl'

	AelwiUI.hideFrame = CreateFrame('Frame')
	AelwiUI.hideFrame:Hide()

	local delay = 0
	local DEBOUNCE_INTERVAL = 0.3

	local function FastLoot()
	    if GetTime() - delay >= DEBOUNCE_INTERVAL then
	        delay = GetTime()

	        if GetCVarBool('autoLootDefault') ~= IsModifiedClick('AUTOLOOTTOGGLE') then
	            for i = GetNumLootItems(), 1, -1 do
	                LootSlot(i)
	            end
	            
	            delay = GetTime()
	        end
	    end
	end

	local faster = CreateFrame('Frame')
	faster:RegisterEvent('LOOT_READY')
	faster:SetScript('OnEvent', FastLoot)

	AelwiUI:UnregisterEvent(event)
end

AelwiUI:RegisterEvent('PLAYER_LOGIN')
AelwiUI:SetScript('OnEvent',AelwiUI.Init)

ns.AelwiUI = AelwiUI