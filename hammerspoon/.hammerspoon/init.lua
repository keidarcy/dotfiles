-- ------------------------------------------------------------------------------------
-- 🔨🥄 Configuration file @keidarcy 
-- ------------------------------------------------------------------------------------
local utils = require("utils")
hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

local hyper = {"alt", "shift"}

-- Window Management
local wm = require("window-manager")
hs.hotkey.bind(hyper, "return", function()
    wm.windowMaximize(0)
end)
hs.hotkey.bind(hyper, "[", function()
    wm.moveWindowToPosition(wm.screenPositions.leftHalf)
end)
hs.hotkey.bind(hyper, "]", function()
    wm.moveWindowToPosition(wm.screenPositions.rightHalf)
end)
hs.hotkey.bind(hyper, "j", function()
    wm.moveWindowToPosition(wm.screenPositions.leftThird)
end)
hs.hotkey.bind(hyper, "k", function()
    wm.moveWindowToPosition(wm.screenPositions.middleThird)
end)
hs.hotkey.bind(hyper, "l", function()
    wm.moveWindowToPosition(wm.screenPositions.rightThird)
end)
hs.hotkey.bind(hyper, "u", function()
    wm.moveWindowToPosition(wm.screenPositions.leftTwoThird)
end)
hs.hotkey.bind(hyper, "i", function()
    wm.moveWindowToPosition(wm.screenPositions.middleHalf)
end)
hs.hotkey.bind(hyper, "o", function()
    wm.moveWindowToPosition(wm.screenPositions.rightTwoThird)
end)

-- Show the bundleID of the currently open window
hs.hotkey.bind(hyper, "b", function()
    local bundleId = hs.window.focusedWindow():application():bundleID()
    hs.alert.show(bundleId)
    hs.pasteboard.setContents(bundleId)
end)

-- App toggle
local tm = require("toggle-me")
local apps = {{"alt", "space", "Alacritty"}}
tm:set_map(apps)

-- load depends on local environment
dofile("env.lua")

-- Change keybind to specific apps
dofile("app-keybinding.lua")

-- Show active window highlighting
local windowHighlight = require("window-highlight")
hs.hotkey.bind(hyper, "h", function()
    windowHighlight.toggle()
end)
windowHighlight.toggle()

-- Show time
hs.hotkey.bind(hyper, "t", function()
    local prettyNow = os.date(
        "%A              📅%B %d %Y              🕐%I:%M:%S %p")
    hs.alert.show(prettyNow, hs.alert.defaultStyle, hs.screen.mainScreen(), 1.5)
end)

-- reload setting
hs.hotkey.bind(hyper, "r", hs.reload)
hs.alert.show("🔨🥄✅")

