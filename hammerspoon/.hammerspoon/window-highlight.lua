-- Window Highlight (highlight focused window)
-- https://github.com/Hammerspoon/hammerspoon/blob/master/extensions/window/window_highlight.lua#L34
-- https://www.hammerspoon.org/docs/hs.window.highlight.html
-- Global settings
hs.window.highlight.ui.overlay = true
hs.window.highlight.ui.overlayColor = {0, 0, 0, 0.01}
-- hs.window.highlight.ui.isolateColor = {0, 0, 0, 0.9}
-- hs.window.highlight.ui.isolateColorInverted = {1, 1, 1, 0.95}
hs.window.highlight.ui.frameWidth = 10
hs.window.highlight.ui.frameColor = {
    red = 0,
    green = 1,
    blue = 0.1,
    alpha = 0.7
}
-- hs.window.highlight.ui.frameColorInvert = {255, 0.4, 0, 0.5}

-- hs.window.highlight.ui.flashDuration = 0
-- hs.window.highlight.ui.windowShownFlashColor = {0, 1, 0, 0.8}
-- hs.window.highlight.ui.windowHiddenFlashColor = {1, 0, 0, 0.8}
-- hs.window.highlight.ui.windowShownFlashColorInvert = {1, 0, 1, 0.8}
-- hs.window.highlight.ui.windowHiddenFlashColorInvert = {0, 1, 1, 0.8}

local module = {}
module.logger = hs.logger.new("windowHighlight.lua")

module.windowFilter = hs.window.filter.new():setOverrideFilter{
    visible = true,
    fullscreen = false,
    allowScreens = "-1,0",
    currentSpace = true
}

module.start = function()
    module.logger.i("Starting Window Highlight")
    hs.window.highlight.start(nil, module.windowFilter)
    hs.hotkey.bind(hyper, "o", function()
        module.stop()
    end)
    return module
end

module.stop = function()
    module.logger.i("Stopping Window Highlight")
    hs.window.highlight.stop()
    return module
end

return module
