-- ------------------------------------------------------------------------------------
-- 🔨🥄 Configuration file @keidarcy
-- ------------------------------------------------------------------------------------
local utils = require("utils")
hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

hyper = {"cmd", "ctrl", "shift"}

-- Window Management
local wm = require("WindowManager")
hs.hotkey.bind(hyper, "return", function()
    wm.windowMaximize(0)
end)
hs.hotkey.bind(hyper, "[", function()
    wm.moveWindowToPosition(wm.screenPositions.leftHalf)
end)
hs.hotkey.bind(hyper, "]", function()
    wm.moveWindowToPosition(wm.screenPositions.rightHalf)
end)
hs.hotkey.bind(hyper, "h", function()
    wm.moveWindowToPosition(wm.screenPositions.leftThird)
end)
hs.hotkey.bind(hyper, "j", function()
    wm.moveWindowToPosition(wm.screenPositions.middleThird)
end)
hs.hotkey.bind(hyper, "k", function()
    wm.moveWindowToPosition(wm.screenPositions.middleHalf)
end)
hs.hotkey.bind(hyper, "l", function()
    wm.moveWindowToPosition(wm.screenPositions.rightThird)
end)
hs.hotkey.bind(hyper, "i", function()
    wm.moveWindowToPosition(wm.screenPositions.leftTwoThird)
end)
hs.hotkey.bind(hyper, "o", function()
    wm.moveWindowToPosition(wm.screenPositions.rightTwoThird)
end)

-- App toggle
local ToggleMe = require("ToggleMe")
local apps = {{"alt", "space", "Alacritty"}}
ToggleMe:setMap(apps)

-- load depends on local environment
if utils.file_exists("local.lua") then
    dofile("local.lua")
end

-- reload setting
hs.hotkey.bind(hyper, "r", hs.reload)
hs.alert.show("🔨🥄✅")
