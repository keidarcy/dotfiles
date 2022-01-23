local WindowManager = {}

-- To easily layout windows on the screen, we use hs.grid to create a 6x4 grid.
-- If you want to use a more detailed grid, simply change its dimension here
local GRID_SIZE_VERTICAL = 4
local GRID_SIZE_HORIZONTAL = 6
local HALF_GRID_SIZE = GRID_SIZE_HORIZONTAL / 2
local THIRD_GRID_SIZE = GRID_SIZE_HORIZONTAL / 3
local TWO_THIRD_GRID_SIZE = GRID_SIZE_HORIZONTAL / 3 * 2

-- Set the grid size and add a few pixels of margin
-- Also, don't animate window changes... That's too slow
hs.grid.setGrid(GRID_SIZE_HORIZONTAL .. "x" ..
                    GRID_SIZE_VERTICAL)
hs.grid.setMargins({10, 10})
hs.window.animationDuration = 0

-- Defining screen positions
local screenPositions = {}
screenPositions.leftHalf = {
    x = 0,
    y = 0,
    w = HALF_GRID_SIZE,
    h = GRID_SIZE_VERTICAL
}

screenPositions.rightHalf = {
    x = HALF_GRID_SIZE,
    y = 0,
    w = HALF_GRID_SIZE,
    h = GRID_SIZE_VERTICAL
}

screenPositions.middleHalf = {
    x = THIRD_GRID_SIZE / 2,
    y = (GRID_SIZE_VERTICAL - GRID_SIZE_VERTICAL / 1.1) / 2,
    w = TWO_THIRD_GRID_SIZE,
    h = GRID_SIZE_VERTICAL / 1.1
}

screenPositions.leftThird = {
    x = 0,
    y = 0,
    w = THIRD_GRID_SIZE,
    h = GRID_SIZE_VERTICAL
}
screenPositions.rightThird = {
    x = TWO_THIRD_GRID_SIZE,
    y = 0,
    w = THIRD_GRID_SIZE,
    h = GRID_SIZE_VERTICAL
}

screenPositions.leftTwoThird = {
    x = 0,
    y = 0,
    w = TWO_THIRD_GRID_SIZE,
    h = GRID_SIZE_VERTICAL
}
screenPositions.rightTwoThird = {
    x = THIRD_GRID_SIZE,
    y = 0,
    w = TWO_THIRD_GRID_SIZE,
    h = GRID_SIZE_VERTICAL
}

screenPositions.middleThird = {
    x = THIRD_GRID_SIZE,
    y = 0,
    w = THIRD_GRID_SIZE,
    h = GRID_SIZE_VERTICAL
}
-- screenPositions.top         = {x = 0,              y = 0,              w = GRID_SIZE_VERTICAL,      h = HALF_GRID_SIZE}
-- screenPositions.bottom      = {x = 0,              y = HALF_GRID_SIZE, w = GRID_SIZE_VERTICAL,      h = HALF_GRID_SIZE}
-- screenPositions.topLeft     = {x = 0,              y = 0,              w = HALF_GRID_SIZE, h = HALF_GRID_SIZE}
-- screenPositions.topRight    = {x = HALF_GRID_SIZE, y = 0,              w = HALF_GRID_SIZE, h = HALF_GRID_SIZE}
-- screenPositions.bottomLeft  = {x = 0,              y = HALF_GRID_SIZE, w = HALF_GRID_SIZE, h = HALF_GRID_SIZE}
-- screenPositions.bottomRight = {x = HALF_GRID_SIZE, y = HALF_GRID_SIZE, w = HALF_GRID_SIZE, h = HALF_GRID_SIZE}

WindowManager.screenPositions = screenPositions

-- This function will move either the specified or the focuesd
-- window to the requested screen position
function WindowManager.moveWindowToPosition(cell, window)
    if window == nil then
        window = hs.window.focusedWindow()
    end
    if window then
        local screen = window:screen()
        hs.grid.set(window, cell, screen)
    end
end

-- This function will move either the specified or the focused
-- window to the center of the sreen and let it fill up the
-- entire screen.
function WindowManager.windowMaximize(factor, window)
    if window == nil then
        window = hs.window.focusedWindow()
    end
    if window then
        window:maximize()
    end
end

return WindowManager
