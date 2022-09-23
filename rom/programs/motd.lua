local tMotd = {}
local settings = require("settings")
local fs = require("fs")
if settings.get("motd.path") == nil then
    settings.set("motd.path", "/rom/motd.txt:/motd.txt")
end

for sPath in string.gmatch(settings.get("motd.path"), "[^:]+") do
    if fs.exists(sPath) then
        for sLine in io.lines(sPath) do
            table.insert(tMotd, sLine)
        end
    end
end

if #tMotd == 0 then
    print("missingno")
else
    print(tMotd[math.random(1, #tMotd)])
end