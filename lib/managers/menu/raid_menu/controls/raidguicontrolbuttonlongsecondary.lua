if not RaidGUIControlButtonLongSecondary then
	slot2 = RaidGUIControlButton
	slot0 = class(slot1)
end

RaidGUIControlButtonLongSecondary = slot0
RaidGUIControlButtonLongSecondary.ICON = "btn_secondary_256"
RaidGUIControlButtonLongSecondary.HOVER_ICON = "btn_secondary_256_hover"
RaidGUIControlButtonLongSecondary.W = tweak_data.gui.icons[RaidGUIControlButtonLongSecondary.ICON].texture_rect[3]
RaidGUIControlButtonLongSecondary.H = tweak_data.gui.icons[RaidGUIControlButtonLongSecondary.ICON].texture_rect[4]
function RaidGUIControlButtonLongSecondary:init(parent, params)
	if not params then
		slot6 = "Trying to create a short primary button without parameters!"

		Application.error(slot4, Application, debug.traceback())

		return 
	end

	params.font = params.font or tweak_data.gui.fonts.din_compressed
	params.font_size = params.font_size or tweak_data.gui.font_sizes.medium
	params.align = "center"
	params.vertical = "center"
	params.color = tweak_data.gui.colors.raid_black
	params.highlight_color = tweak_data.gui.colors.raid_black
	params.texture = tweak_data.gui.icons[RaidGUIControlButtonLongSecondary.ICON].texture
	params.texture_rect = tweak_data.gui.icons[RaidGUIControlButtonLongSecondary.ICON].texture_rect
	params.texture_color = Color.white
	params.highlight_texture = tweak_data.gui.icons[RaidGUIControlButtonLongSecondary.HOVER_ICON].texture
	params.highlight_texture_rect = tweak_data.gui.icons[RaidGUIControlButtonLongSecondary.HOVER_ICON].texture_rect
	params.texture_highlight_color = Color.white
	params.w = RaidGUIControlButtonLongSecondary.W
	params.h = RaidGUIControlButtonLongSecondary.H
	slot7 = params

	RaidGUIControlButtonLongSecondary.super.init(RaidGUIControlButtonLongSecondary.HOVER_ICON, self, parent)

	return 
end

return 
