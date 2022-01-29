ToggleMe = {
    app_map = {}
}

function ToggleMe:set_map(appMap)
    ToggleMe.app_map = appMap
    for index, map in ipairs(appMap) do
        hs.hotkey.bind(map[1], map[2], function()
            ToggleMe:toggle_app(map[3])
        end)
    end
end

function ToggleMe:toggle_app(app_name)
    local app = hs.application.find(app_name)
    if app ~= nil then
        if app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    -- else
    --     hs.application.open(app_name)
    end
end

return ToggleMe
