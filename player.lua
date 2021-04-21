local audioFormats = {"mp3", "ogg"}

local function stop(handle)
    if (handle ~= nil) then
        StopSound(handle)
    end
end

local soundHandle = nil
local function playAudio(name)
    if (name == "stop") then
        stop(soundHandle)
        soundHandle = nil
    else
        for _, format in pairs(audioFormats) do
            played, handle = PlaySoundFile("Interface\\Addons\\Mallard\\Audio\\" .. name .. "." .. format, "Master")
            if (played ~= nil) then
                stop(soundHandle)
                soundHandle = handle
                break
            end
        end
    end
end

local function handleChatEvent(self, event, message, ...)
    if (string.sub(message, 1, 1) == '!') then
        playAudio(string.sub(message, 2, -1))
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_GUILD")
frame:SetScript("OnEvent", handleChatEvent)
