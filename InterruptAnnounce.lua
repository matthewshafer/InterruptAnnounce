
-- put the spell id of your interrupt here
local spellId = 2139


-- You shouldnt be messing with these functions

local function InterfaceAnnounce(self, event, unitType, sId)

	if (unitType == "player" and sId == spellId) then
		name = GetSpellInfo(sId);
		output = "{circle} " .. name .. " used! {circle}"
		SendChatMessage(output, "RAID")
	end
end
	

local function eventHandler(self, event, arg1, _, _, _, arg5)
	if(event == "UNIT_SPELLCAST_SUCCEEDED") then
		InterfaceAnnounce(self, event, arg1, arg5)
	end
end

SLASH_INTERFACEANNOUNCE1 = "/ia"
SlashCmdList["INTERFACEANNOUNCE"] = function(msg)
	print("Nothing here yet");
end


local frame = CreateFrame("FRAME", "InterfaceAnnounce");
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

frame:SetScript("OnEvent", eventHandler)