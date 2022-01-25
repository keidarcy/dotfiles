local Utils = {}

function Utils.file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

function Utils.key_stroke(mods, key)
    return function()
        hs.eventtap.keyStroke(mods, key, 0)
    end
end

function Utils.remap(mods, key, fn)
    return hs.hotkey.bind(mods, key, fn, nil, fn)
end

return Utils
