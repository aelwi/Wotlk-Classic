local _, ns = ...
local AelwiUI = ns.AelwiUI

function AelwiUI:Minimap()
	MinimapBorderTop:Hide()
	MiniMapWorldMapButton:Hide()
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	MinimapZoneText:Hide()
	-- GameTimeFrame:Hide()
	
	Minimap:EnableMouseWheel(true)
	local function Zoom(self, direction)
		if direction > 0 then 
			Minimap_ZoomIn()
		else 
			Minimap_ZoomOut() 
		end
	end
	Minimap:SetScript('OnMouseWheel', Zoom)

	WorldMapFrame:SetScale(.8)
    WorldMapFrame.BlackoutFrame:EnableMouse(false)
    WorldMapFrame.BlackoutFrame:SetAlpha(0)

    WorldMapFrame.ScrollContainer.GetCursorPosition = function(frame)
        local x, y = MapCanvasScrollControllerMixin.GetCursorPosition(frame)
        local s = WorldMapFrame:GetScale()
        return x/s, y/s
    end
end