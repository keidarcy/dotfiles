-- ------------------------------------------------------------------------------------
-- 🔨🥄 Configuration file @keidarcy
-- ------------------------------------------------------------------------------------
hyper = {"cmd", "ctrl", "shift"}

hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

local wm = require("WindowManager")
-- Window Management
hs.hotkey.bind(hyper, "u", function()
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
local toggleKey = "alt"
local apps = {{toggleKey, "1", "Google Chrome"},
              {toggleKey, "2", "com.microsoft.VSCode"},
              {toggleKey, "3", "Slack"},
              {toggleKey, "4", "com.insomnia.app"},
              {toggleKey, "space", "Alacritty"}}
ToggleMe:setMap(apps)

-- reload setting
hs.hotkey.bind(hyper, "r", hs.reload)
hs.alert.show("🔨🥄✅")
