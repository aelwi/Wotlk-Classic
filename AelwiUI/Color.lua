local _, ns = ...
local AelwiUI = ns.AelwiUI

function AelwiUI:Color()
	for _,v in pairs({
		PlayerFrameTexture,
		PlayerFrameVehicleTexture,
		PlayerFrameAlternateManaBarBorder,
		PlayerFrameAlternateManaBarLeftBorder,
		PlayerFrameAlternateManaBarRightBorder,
		
  		PetFrameTexture,
		
		PlayerFrameGroupIndicatorLeft,
		PlayerFrameGroupIndicatorRight,
		PlayerFrameGroupIndicatorMiddle,
		
   		TargetFrameTextureFrameTexture,
		TargetFrameToTTextureFrameTexture,
		
		FocusFrameTextureFrameTexture,
		FocusFrameToTTextureFrameTexture,
		
		PartyMemberFrame1Texture,
		PartyMemberFrame2Texture,
		PartyMemberFrame3Texture,
		PartyMemberFrame4Texture,
		
		PartyMemberFrame1VehicleTexture,
		PartyMemberFrame2VehicleTexture,
		PartyMemberFrame3VehicleTexture,
		PartyMemberFrame4VehicleTexture,
		
		PartyMemberFrame1PetFrameTexture,
		PartyMemberFrame2PetFrameTexture,
		PartyMemberFrame3PetFrameTexture,
		PartyMemberFrame4PetFrameTexture,
			
		MirrorTimer1Border,
		MirrorTimer2Border,

		MiniMapMailBorder,
		MiniMapBattlefieldBorder,
		MiniMapLFGFrameBorder,
		
		CastingBarFrame.Border,
		PetCastingBarFrame.Border,
		
		TargetFrameSpellBar.Border,
		TargetFrameSpellBar.BorderShield,
		
		FocusFrameSpellBar.Border,
		FocusFrameSpellBar.BorderShield,
		
		select(1, TimeManagerClockButton:GetRegions()), 
		select(1, GameTimeFrame:GetRegions()),
		
		ExhaustionTick:GetNormalTexture(),

		KeyRingButton:GetNormalTexture(),

		ActionBarUpButton:GetNormalTexture(),
		ActionBarDownButton:GetNormalTexture(),
		
		MainMenuBarTexture0,
		MainMenuBarTexture1,
		MainMenuBarTexture2,
		MainMenuBarTexture3,

		MainMenuXPBarTexture0,
		MainMenuXPBarTexture1,
		MainMenuXPBarTexture2,
		MainMenuXPBarTexture3,
		
		MainMenuMaxLevelBar0,
		MainMenuMaxLevelBar1,
		MainMenuMaxLevelBar2,
		MainMenuMaxLevelBar3,
		
		ReputationWatchBar.StatusBar.XPBarTexture0,
		ReputationWatchBar.StatusBar.XPBarTexture1,
		ReputationWatchBar.StatusBar.XPBarTexture2,
		ReputationWatchBar.StatusBar.XPBarTexture3,

		ReputationWatchBar.StatusBar.WatchBarTexture0,
		ReputationWatchBar.StatusBar.WatchBarTexture1,
		ReputationWatchBar.StatusBar.WatchBarTexture2,
		ReputationWatchBar.StatusBar.WatchBarTexture3,
		
		StanceBarLeft,
		StanceBarMiddle,
		StanceBarRight,
		
		SlidingActionBarTexture0,
		SlidingActionBarTexture1,
		
		MainMenuBarLeftEndCap,
		MainMenuBarRightEndCap,
	}) do
		v:SetVertexColor(unpack(AelwiUI.textureColor))	
	end
	
	for _, gossip in pairs({
		ArenaRegistrarFrame,
		ArenaRegistrarGreetingFrame,
		QuestFrameGreetingPanel,
		QuestFrameDetailPanel,
		QuestFrameProgressPanel,
		QuestFrameRewardPanel,
		GossipFrame.GreetingPanel,
		QuestLogFrame,
		PetitionFrame,
		QuestLogDetailFrame
	}) do
		for _, v in pairs({gossip:GetRegions()}) do 
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		end
	
		gossip.Material = gossip:CreateTexture(nil, 'OVERLAY', nil, 7)
		gossip.Material:SetTexture[[Interface\AddOns\AelwiUI\textures\QuestBG.tga]]
		gossip.Material:SetWidth(506)
		gossip.Material:SetHeight(506)
		gossip.Material:SetVertexColor(.7, .7, .7)
		
		if gossip == QuestLogFrame then
			gossip.Material:SetPoint('TOPRIGHT', gossip, 175, -78)
		else
			gossip.Material:SetPoint('TOPLEFT', gossip, 24, -82)
		end

		if gossip == GossipFrameGreetingPanel or gossip == QuestFrameGreetingPanel or gossip == ArenaRegistrarFrame or gossip == ArenaRegistrarGreetingFrame then
			gossip.Corner = gossip:CreateTexture(nil, 'OVERLAY', nil, 7)
			gossip.Corner:SetTexture[[Interface\QuestFrame\UI-Quest-BotLeftPatch]]
			gossip.Corner:SetWidth(132)
			gossip.Corner:SetHeight(64)
			gossip.Corner:SetPoint('BOTTOMLEFT', gossip, 21, 68)
			gossip.Corner:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({OverrideActionBar:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({TargetFrameNumericalThreat:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({FocusFrameNumericalThreat:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({TaxiFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({DropDownList1MenuBackdrop.NineSlice:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({DropDownList2MenuBackdrop.NineSlice:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({WorldMapFrame.BorderFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	
	
	for _,v in pairs({TokenFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({GearManagerDialog:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({select(2,BankFrame:GetRegions())}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({PetPaperDollFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	
	for _,v in pairs({select(2,MailFrame:GetRegions())}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end	
	end
	
	for i=1,2 do
		for _,v in pairs({_G['MailFrameTab'..i]:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		end
	end

	for _,v in pairs({OpenMailFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end	
	end
	
	for _,v in pairs({select(2,BattlefieldFrame:GetRegions())}) do 
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	
	for _,v in pairs({GossipFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({PaperDollFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	
	for i=1,5 do
		for _,v in pairs({_G['CharacterFrameTab'..i]:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		end
	end
	
	for _,v in pairs({select(2,TabardFrame:GetRegions())}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	
	for _,v in pairs({ReputationFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	
	for _,v in pairs({SkillFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({PVPFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for i=1,2 do
		for _,v in pairs({_G['PVPParentFrameTab'..i]:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		end
	end
	
	for _,v in pairs({DressUpFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end

	for _,v in pairs({SpellBookFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	SpellBookFrame:GetRegions():SetVertexColor(1,1,1,1)
	
	for i=1,3 do
		for _,v in pairs({_G['SpellBookFrameTabButton'..i]:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		end
	end
	
	SpellBookFrame.Material = SpellBookFrame:CreateTexture(nil, 'OVERLAY', nil, 7)
	SpellBookFrame.Material:SetTexture[[Interface\AddOns\AelwiUI\textures\QuestBG.tga]]
	SpellBookFrame.Material:SetWidth(525)
	SpellBookFrame.Material:SetHeight(535)
	SpellBookFrame.Material:SetPoint('TOPLEFT', SpellBookFrame, 28, -74)
	SpellBookFrame.Material:SetVertexColor(.7, .7, .7)
	
	for _,v in pairs({FriendsFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	FriendsFrame:GetRegions():SetVertexColor(1,1,1,1)
	
	for i=1,5 do
		for _,v in pairs({_G['FriendsFrameTab'..i]:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		end
	end
		
	for _,v in pairs({LootFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	LootFrame:GetRegions():SetVertexColor(1,1,1,1)

	for _,v in pairs({TradeFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	TradeFrame:GetRegions():SetVertexColor(1,1,1,1)
	
	for i=1,12 do
		for _,v in pairs({_G['ContainerFrame'..i]:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		end
	end
	
	for _,v in pairs({ItemTextFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end		
	end
	
	ItemTextFrame.Material = ItemTextFrame:CreateTexture(nil, 'OVERLAY', nil, 7)
	ItemTextFrame.Material:SetTexture[[Interface\AddOns\AelwiUI\textures\QuestBG.tga]]
	ItemTextFrame.Material:SetHeight(530)
	ItemTextFrame.Material:SetWidth(506)
	ItemTextFrame.Material:SetPoint('TOPLEFT', ItemTextFrame, 24, -82)
	ItemTextFrame.Material:SetVertexColor(.9, .9, .9)
	
	for _,v in pairs({HelpFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end		
	end
	
	for _,v in pairs({PetStableFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' and v ~= PetStableFramePortrait then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end	
	end
	
	for _,v in pairs({WorldStateScoreFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end	
	end
	
	for i=1,3 do
		for _,v in pairs({_G['WorldStateScoreFrameTab'..i]:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end	
		end	
	end
	
	for _,v in pairs({MerchantFrame:GetRegions()}) do
		if v:GetObjectType() == 'Texture' then
			v:SetVertexColor(unpack(AelwiUI.textureColor))
		end
	end
	MerchantFrame:GetRegions():SetVertexColor(1,1,1,1)
	
	for i=1,2 do
		for _,v in pairs({_G['MerchantFrameTab'..i]:GetRegions()}) do
			if v:GetObjectType() == 'Texture' then
				v:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		end	
	end
	
	GossipFramePortrait:SetVertexColor(1,1,1,1)
	
	local listener = CreateFrame('Frame')
	listener:RegisterEvent('ADDON_LOADED')
	listener:SetScript('OnEvent',function(self,event,addon)
		if addon == 'Blizzard_ArenaUI' then
			for i=1,MAX_ARENA_ENEMIES do
				_G['ArenaEnemyFrame'..i..'Texture']:SetVertexColor(unpack(AelwiUI.textureColor))
				_G['ArenaEnemyFrame'..i..'PetFrameTexture']:SetVertexColor(unpack(AelwiUI.textureColor))
			end
		elseif addon == 'Blizzard_LookingForGroupUI' then
			LFGListingFrameBackgroundArt:SetVertexColor(unpack(AelwiUI.textureColor))
			LFGListingFrameFrameBackgroundBottom:SetVertexColor(unpack(AelwiUI.textureColor))
			LFGListingFrameFrameBackgroundTop:SetVertexColor(unpack(AelwiUI.textureColor))

			LFGBrowseFrameFrameBackgroundBottom:SetVertexColor(unpack(AelwiUI.textureColor))
			LFGBrowseFrameFrameBackgroundMiddle:SetVertexColor(unpack(AelwiUI.textureColor))
			LFGBrowseFrameFrameBackgroundTop:SetVertexColor(unpack(AelwiUI.textureColor))
			for i=1,2 do
				for _,v in pairs({_G['LFGParentFrameTab'..i]:GetRegions()}) do
					if v:GetObjectType() == 'Texture' then
						v:SetVertexColor(unpack(AelwiUI.textureColor))
					end
				end
			end
		elseif addon == 'Blizzard_AchievementUI' then
			for _,v in pairs({AchievementFrameHeader:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			for _,v in pairs({AchievementFrameSummary:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end	
		elseif addon == 'Blizzard_GlyphUI' then
			for _,v in pairs({GlyphFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
		elseif addon == 'Blizzard_TalentUI' then
			for _,v in pairs({PlayerTalentFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			for _,v in pairs({PlayerTalentFramePointsBar:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			for i=1,4 do
				for _,v in pairs({_G['PlayerTalentFrameTab'..i]:GetRegions()}) do
					if v:GetObjectType() == 'Texture' then
						v:SetVertexColor(unpack(AelwiUI.textureColor))
					end
				end
			end
			PlayerTalentFrame:GetRegions():SetVertexColor(1,1,1,1)
			for _,v in pairs({PlayerTalentFrameScrollFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
		elseif addon == 'Blizzard_MacroUI' then
			for _,v in pairs({MacroFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			MacroFrame:GetRegions():SetVertexColor(1,1,1,1)
		elseif addon == 'Blizzard_CraftUI' then
			for _,v in pairs({CraftFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			CraftFrame:GetRegions():SetVertexColor(1,1,1,1)
		elseif addon == 'Blizzard_TradeSkillUI' then
			for _,v in pairs({TradeSkillFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			TradeSkillFrame:GetRegions():SetVertexColor(1,1,1,1)
		elseif addon == 'Blizzard_TrainerUI' then
			for _,v in pairs({ClassTrainerFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			ClassTrainerFrame:GetRegions():SetVertexColor(1,1,1,1)		
		elseif addon == 'Blizzard_ItemSocketingUI' then
			for _,v in pairs({ItemSocketingFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			ItemSocketingFrame:GetRegions():SetVertexColor(1,1,1,1)
		elseif addon == 'Blizzard_GuildBankUI' then
			for _,v in pairs({GuildBankFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			GuildBankFrame:GetRegions():SetVertexColor(1,1,1,1)	
		elseif addon == 'Blizzard_AuctionUI' then
			for _,v in pairs({AuctionFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			AuctionFrame:GetRegions():SetVertexColor(1,1,1,1)
			for i=1,3 do
				for _,v in pairs({_G['AuctionFrameTab'..i]:GetRegions()}) do
					if v:GetObjectType() == 'Texture' then
						v:SetVertexColor(unpack(AelwiUI.textureColor))
					end
				end
			end
		elseif addon == 'Blizzard_InspectUI' then
			for _,v in pairs({InspectPaperDollFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			for _,v in pairs({InspectPVPFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			for _,v in pairs({InspectTalentFrame:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			for _,v in pairs({InspectTalentFramePointsBar:GetRegions()}) do
				if v:GetObjectType() == 'Texture' then
					v:SetVertexColor(unpack(AelwiUI.textureColor))
				end
			end
			for i=1,3 do
				for _,v in pairs({_G['InspectFrameTab'..i]:GetRegions()}) do
					if v:GetObjectType() == 'Texture' then
						v:SetVertexColor(unpack(AelwiUI.textureColor))
					end				
				end
			end
			InspectFrame:GetRegions():SetVertexColor(1,1,1,1)
		elseif addon == 'Blizzard_CombatText' then
			local size = 16

			CombatTextFont:SetFont(STANDARD_TEXT_FONT, size, 'OUTLINE')
			CombatTextFont:SetShadowOffset(1,-1)
			CombatTextFont:SetShadowColor(0,0,0,0.6)

			CombatTextFontOutline:SetFont(STANDARD_TEXT_FONT, size, 'OUTLINE')
			CombatTextFontOutline:SetShadowOffset(1,-1)
			CombatTextFontOutline:SetShadowColor(0,0,0,0.6)

			COMBAT_TEXT_HEIGHT = size
			COMBAT_TEXT_CRIT_MAXHEIGHT = size*1
			COMBAT_TEXT_CRIT_MINHEIGHT = size*1
			COMBAT_TEXT_SCROLLSPEED = 2
			COMBAT_TEXT_Y_SCALE = 1.1

			hooksecurefunc('CombatText_UpdateDisplayedMessages',function(self)
				COMBAT_TEXT_LOCATIONS.startX = -300
				COMBAT_TEXT_LOCATIONS.endX = -300

				COMBAT_TEXT_LOCATIONS.startY = 600
				COMBAT_TEXT_LOCATIONS.endY = 800

			end)

			CombatText_UpdateDisplayedMessages(CombatText)
		end
	end)

	local function addBackDropMixin(frame)
		if not frame.SetBackdrop then
			Mixin(frame, BackdropTemplateMixin)
		end
	end

	local function styleTooltip(self,style)
		addBackDropMixin(self)

		local backdrop = {
			bgFile = 'Interface\\Buttons\\WHITE8x8',
			edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
			tile = false,
			tileEdge = false,
			tileSize = 16,
			edgeSize = 16,
			insets = {left=3, right=3, top=3, bottom=3}
		}

		self:SetBackdrop(backdrop)
		self:SetBackdropColor(0,0,0,.5)
	end

	hooksecurefunc('SharedTooltip_SetBackdropStyle', styleTooltip)

	local tooltips = { 
		GameTooltip,
		ShoppingTooltip1,
		ShoppingTooltip2,
		ItemRefTooltip,
		ItemRefShoppingTooltip1,
		ItemRefShoppingTooltip2,
		WorldMapTooltip,
		WorldMapCompareTooltip1,
		WorldMapCompareTooltip2,
		SmallTextTooltip,
	}

	for i, tooltip in next, tooltips do 
		styleTooltip(tooltip) 
	end
end