-- Window Switcher
-- This will override mac default cmd+tab
local switcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true))
function mapCmdTab(event)
	local flags = event:getFlags()
	local chars = event:getCharacters()
	if chars == "\t" and flags:containExactly({ "cmd" }) then
		switcher:next()
		return true
	elseif chars == string.char(25) and flags:containExactly({ "cmd", "shift" }) then
		switcher:previous()
		return true
	end
end
local tapCmdTab = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, mapCmdTab)

return tapCmdTab
