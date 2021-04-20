local audioFormats = {"mp3", "ogg"}

local function playAudio(name)
    for _, format in pairs(audioFormats) do
        local exists = PlaySoundFile("Interface\\Addons\\Mallard\\Audio\\" .. name .. "." .. format, "Master")
        if (exists ~= nil) then
            break
        end
    end
end

local function handleGuildChat(self, event, message, ...)
    if (string.sub(message, 1, 1) == '!') then
        playAudio(string.sub(message, 2, -1))
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", handleGuildChat)