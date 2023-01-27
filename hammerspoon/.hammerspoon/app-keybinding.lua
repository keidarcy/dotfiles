local utils = require("utils")

local chrome_keys = {
	-- utils.remap({ "ctrl", "shift" }, "j", utils.key_stroke({}, "down")),
	-- utils.remap({ "ctrl", "shift" }, "k", utils.key_stroke({}, "up")),
	utils.remap({ "ctrl" }, "p", utils.key_stroke({}, "up")),
	utils.remap({ "ctrl" }, "n", utils.key_stroke({}, "down")),
	utils.remap({ "shift", "cmd" }, "E", utils.key_stroke({ "alt", "cmd" }, "i")),
}

local global_keys = {
	utils.remap({ "cmd" }, "M", utils.key_stroke({}, "escape")),
	utils.remap({ "fn" }, "f11", utils.key_stroke({ "cmd" }, "1")),
}

local apps = {
	["com.mongodb.compass"] = true,
	["com.google.Chrome"] = true,
	["com.google.Chrome.canary"] = true,
	["com.insomnia.app"] = true,
}

local function handle_app_event(_, event, app)
	local bundleID = app:bundleID()
	-- global keybind

	-- Chrome keybind
	if event == hs.application.watcher.activated then
		if apps[bundleID] then
			for _, key in ipairs(chrome_keys) do
				key:enable()
			end
		end
	end
	if event == hs.application.watcher.deactivated then
		if apps[bundleID] then
			for _, key in ipairs(chrome_keys) do
				key:disable()
			end
		end
	end
end

for _, key in ipairs(global_keys) do
	key:enable()
end

return hs.application.watcher.new(handle_app_event)
