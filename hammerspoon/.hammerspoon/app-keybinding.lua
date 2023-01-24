local utils = require("utils")

local chrome_keys = {
	utils.remap({ "ctrl", "shift" }, "j", utils.key_stroke({}, "down")),
	utils.remap({ "ctrl", "shift" }, "k", utils.key_stroke({}, "up")),
	-- utils.remap({ "ctrl" }, "p", utils.key_stroke({}, "up")),
	utils.remap({ "shift", "cmd" }, "E", utils.key_stroke({ "alt", "cmd" }, "i")),
}

local function handle_app_event(_, event, app)
	local bundleID = app:bundleID()
	-- Chrome keybind
	if event == hs.application.watcher.activated then
		if bundleID == "com.google.Chrome" or bundleID == "com.google.Chrome.canary" then
			for _, key in ipairs(chrome_keys) do
				key:enable()
			end
		end
	end
	if event == hs.application.watcher.deactivated then
		if bundleID == "com.google.Chrome" or bundleID == "com.google.Chrome.canary" then
			for _, key in ipairs(chrome_keys) do
				key:disable()
			end
		end
	end
end

return hs.application.watcher.new(handle_app_event)
