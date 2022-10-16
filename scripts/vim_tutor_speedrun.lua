#!/usr/bin/lua

--[[
local handle = io.popen("date +%s%N | cut -b1-13")
if handle == nil then return end
local start = handle:read("*a")

os.execute("nvim +Tutor")

handle = io.popen("date +%s%N | cut -b1-13")
if handle == nil then return end
local finish = handle:read("*a")

handle:close()

print("Speedrun time: " .. string.format("%.3fs", (finish - start) / 1000))
]]--

local socket = require("socket")

PB = 0

function Main()
    local start = socket.gettime() * 1000

    os.execute("nvim +Tutor")

    local end_time = (socket.gettime() * 1000) - start

    print("[" .. os.date() .. "]\n")
    if (end_time / 1000) < PB then
        print("!!!!!")
        print("!!! NEW PB: " .. string.format("%.3fs", end_time / 1000))
        print("!!!!!")
        print("(edit the file to save the new PB)\n")
    else
        print("Speedrun time: " .. string.format("%.3fs", end_time / 1000) .. "\n")
    end
end

Main()
