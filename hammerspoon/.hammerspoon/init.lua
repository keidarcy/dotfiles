require('./toggleTerminal')

-- function moveToNextScreen()
--   local app = hs.window.focusedWindow()
--   app:moveToScreen(app:screen():next())
--   app:maximize()
-- end

-- hs.hotkey.bind({"ctrl", "alt"}, "n", moveToNextScreen)

hs.hotkey.bind({"ctrl", "alt"}, "n", function()
  local app = hs.window.focusedWindow()
  app:moveToScreen(app:screen():next())
  -- app:maximize()
end)
