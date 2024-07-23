-- require this to get the "Platform" table for the detected os

-- we guess based on the home prefix
-- (bless your heart if you're on windows outside wsl)
local home_path = os.getenv("HOME") or ""
if string.match(home_path, "^/home") then
    require("config.os.linux")
elseif string.match(home_path, "^/Users") then
    require("config.os.mac")
end

-- TODO:there's probably a better way to do this, but this Works For Me™
