local utils = require("utils")

if utils.file_exists("work") then
    require "work"
end

if utils.file_exists("personal") then
    require "personal"
end

