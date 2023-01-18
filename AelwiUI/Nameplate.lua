local _, ns = ...
local AelwiUI = ns.AelwiUI

function AelwiUI:Nameplate()
	local function AddElements(plate)
	    if plate:IsForbidden() then
	        return
	    end

        local sh = plate.selectionHighlight
        sh:SetPoint('TOPLEFT', sh:GetParent(), 'TOPLEFT', -1, 1)
        sh:SetPoint('BOTTOMRIGHT', sh:GetParent(), 'BOTTOMRIGHT', 1, -1)

	    for _, v in pairs({plate.CastBar.Border, plate.CastBar.BorderShield}) do
	        v:SetVertexColor(unpack(AelwiUI.textureColor))
	    end
	end

	local function HidePlates(plate, unit)
	    if plate:IsForbidden() then
	        return
	    end

	    local _, _, _, _, _, npcId = string.split('-', UnitGUID(unit))

		if npcId == '29264' or npcId == '1964' or npcId == '26125' or npcId == '24207' or npcId == '19833' or npcId == '19921' or npcId == '31216' or npcId == '32441' then
	        plate.UnitFrame:Hide()
	    else
	        plate.UnitFrame:Show()
	    end
	end

	local function onEvent(self,event,...)
		local base = ...

        local namePlateFrameBase = C_NamePlate.GetNamePlateForUnit(base, issecure())

        if not namePlateFrameBase then
            return
        end

        HidePlates(namePlateFrameBase, base)
        AddElements(namePlateFrameBase.UnitFrame)
    end


	local e = CreateFrame('Frame')
	e:RegisterEvent('NAME_PLATE_UNIT_ADDED')
	e:SetScript('OnEvent', onEvent)
end
