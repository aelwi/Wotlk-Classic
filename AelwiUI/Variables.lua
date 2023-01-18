﻿local _, ns = ...
local AelwiUI = ns.AelwiUI

function AelwiUI:Variables()
	SetCVar('useUIScale',1)
	SetCVar('uiScale',.64)
	SetCVar('timingMethod',2)
	SetCVar('weatherDensity',0)
	SetCVar('maxFPS',117)
	SetCVar('targetFPS',117)
	SetCVar('cameraDistanceMaxZoomFactor',2.6)
	SetCVar('taintLog',1)
	SetCVar('previewTalents',1)
	SetCVar('equipmentManager',1)
	SetCVar('fullSizeFocusFrame',1)
	SetCVar('instantQuestText',1)
	SetCVar('showMinimapClock',1)
	SetCVar('threatWarning',3)
	SetCVar('ActionButtonUseKeyDown',1)
	SetCVar('autoSelfCast',1)
	SetCVar('autoLootDefault',1)
	SetCVar('colorChatNamesByClass',1)
	SetCVar('ffxDeath',0)
	SetCVar('ffxglow',0)
	SetCVar('ffxnether',0)
	SetCVar('nameplateGlobalScale',.5)
	SetCVar('nameplateSelectedScale',1)
	SetCVar('nameplateVerticalScale', 1) 
	SetCVar('nameplateMaxDistance', 41)
	SetCVar('scriptErrors',1)
	SetCVar('secureAbilityToggle',0)
	SetCVar('showArenaEnemyFrames',1)
	SetCVar('SpellQueueWindow',120)
	SetCVar('statusTextDisplay','NUMERIC')
	SetCVar('statusText',0)
	SetCVar('WorldTextScale',.8)
	SetCVar('floatingCombatTextCombatDamageDirectionalScale',0)
	SetCVar('enableFloatingCombatText',0)
	SetCVar('enableFloatingCombatText',1)
	SetCVar('xpBarText',0)
	SetCVar('shadowlod',0)
	SetCVar('showshadow',0)
	SetCVar('showfootprints',0)
	SetCVar('showfootprintparticles',0)
	SetCVar('overridefarclip',0)
	SetCVar('farclip',177)
	SetCVar('horizonfarclip',1305)
	SetCVar('detailDoodadAlpha',0)
	SetCVar('groundeffectdensity',16)
	SetCVar('groundeffectdist',1)
	SetCVar('smallcull',1)
	SetCVar('skycloudlod',1)
	SetCVar('characterAmbient',1)
	SetCVar('extshadowquality',0)
	SetCVar('environmentDetail',0.5)

	SetConsoleKey('F7')
	
	CameraZoomOut(255)
end