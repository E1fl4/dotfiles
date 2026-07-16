local M = {}

local function get_color(name)
    local p = assert(io.popen("bash -c 'source ~/.cache/wal/colors.sh && echo $" .. name .. "'"))
    local c = p:read("*a")
    p:close()
    return c:gsub("%s+", "")
end

for i = 0, 15 do
    M["color" .. i] = get_color("color" .. i)
end

M.background = get_color("background")
M.inactive = "rgba(" .. string.sub(get_color("background"), 2, -1) .. "90)"

return M
