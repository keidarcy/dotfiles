ToggleMe = {
    app_map = {}
}

function ToggleMe:setMap(appMap)
    ToggleMe.app_map = appMap
    for index, map in ipairs(appMap) do
        hs.hotkey.bind(map[1], map[2], function()
            ToggleMe:toggleApp(map[3])
        end)
    end
end

function ToggleMe:toggleApp(app_name)
    local app = hs.application.find(app_name)
    if app ~= nil then
        if app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.open(app_name)
    end
end

return ToggleMe

