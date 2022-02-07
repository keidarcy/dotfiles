local utils = require("utils")

local chrome_keys = {utils.remap({"ctrl"}, "j", utils.key_stroke({}, "down")),
                     utils.remap({"ctrl"}, "k", utils.key_stroke({}, "up")),
                     utils.remap({"shift", "cmd"}, "E",
    utils.key_stroke({"alt", "cmd"}, "i"))}

local slack_keys = {utils.remap({"ctrl"}, "j", utils.key_stroke({}, "down")),
                    utils.remap({"ctrl"}, "k", utils.key_stroke({}, "up"))}

local function handle_app_event(name, event, app)
    -- Chrome keybind
    if event == hs.application.watcher.activated then
        if app:bundleID() == "com.google.Chrome" or app:bundleID() ==
            "com.google.Chrome.canary" or app:bundleID() == "com.runningwithcrayons.Alfred" then
            for _, key in ipairs(chrome_keys) do
                key:enable()
            end
        end
    end
    if event == hs.application.watcher.deactivated then
        if app:bundleID() == "com.google.Chrome" or app:bundleID() ==
            "com.google.Chrome.canary" or app:bundleID() == "com.runningwithcrayons.Alfred" then
            for _, key in ipairs(chrome_keys) do
                key:disable()
            end
        end
    end

    -- slack keybind
    if event == hs.application.watcher.activated then
        if app:bundleID() == "com.tinyspeck.slackmacgap" then
            for _, key in ipairs(slack_keys) do
                key:enable()
            end
        end
    end
    if event == hs.application.watcher.deactivated then
        if app:bundleID() == "com.tinyspeck.slackmacgap" then
            for _, key in ipairs(slack_keys) do
                key:disable()
            end
        end
    end
end

apps_watcher = hs.application.watcher.new(handle_app_event)
apps_watcher:start()
