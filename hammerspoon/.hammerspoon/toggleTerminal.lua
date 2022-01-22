hs.hotkey.bind({"alt"}, "space", function()
    local alacritty = hs.application.find('alacritty')
    if alacritty ~= nil and alacritty:isFrontmost() then
        alacritty:hide()
    else
        hs.application.launchOrFocus("/Applications/Alacritty.app")
        local alacritty = hs.application.open('alacritty')
        alacritty.setFrontmost(alacritty)
        alacritty.activate(alacritty)
    end
end)
