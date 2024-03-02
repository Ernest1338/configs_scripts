#!/usr/bin/lua

PB = 0

local function cmd_output(cmd)
    local f = assert(io.popen(cmd, "r"))
    local s = assert(f:read("*a"))
    f:close()
    return s
end

function Main()
    local start = cmd_output("date +%s%3N")

    os.execute("nvim +Tutor")
    -- os.execute("TERM=xterm-256color WINIT_UNIX_BACKEND=x11 neovide --multigrid --nofork +Tutor")

    local end_time = cmd_output("date +%s%3N") - start

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
