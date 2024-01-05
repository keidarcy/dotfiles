ToggleMe = {
	app_map = {},
}

function ToggleMe:set_map(appMap)
	ToggleMe.app_map = appMap
	for _, map in ipairs(appMap) do
		hs.hotkey.bind(map[1], map[2], function()
			ToggleMe:toggle_app(map[3])
		end)
	end
end

-- local log = hs.logger.new("toggle-me", "debug")

function ToggleMe:toggle_app(app_name)
	local app = hs.application.find(app_name)

	if app ~= nil then
		if app:isFrontmost() then
			app:hide()
			hs.alert.show(app_name .. " Hide", hs.alert.defaultStyle, hs.screen.mainScreen(), 1.5)
		else
			app:activate()
			hs.alert.show(app_name .. " Show", hs.alert.defaultStyle, hs.screen.mainScreen(), 1.5)
		end
		-- else
		--     hs.application.open(app_name)
	end
end

return ToggleMe
