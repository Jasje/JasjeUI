local T, C, L, G = unpack(Tukui)

f = CreateFrame("Frame")
f:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")

f:SetScript("OnEvent", function()
	--make sure we're in an arena and not a battleground
	isUnratedArena, isRatedArena = IsActiveBattlefieldArena()
	if(isRatedArena) then
		--If the arena has not yet ended, return without doing anything
		battlefieldWinner = GetBattlefieldWinner()
		if (battlefieldWinner == nil) then
			return
		end
		
		--Get info from scoreboard
		teamName0, oldTeamRating0, newTeamRating0, matchMakingRating0 = GetBattlefieldTeamInfo(0)
		teamName1, oldTeamRating1, newTeamRating1, matchMakingRating1 = GetBattlefieldTeamInfo(1)
		
		SendChatMessage(teamName0 .. " (now: " .. newTeamRating0 .. "; before: " .. oldTeamRating0 .. "; mmr: " .. matchMakingRating0 .. ").","PARTY")
		SendChatMessage(teamName1 .. " (now: " .. newTeamRating1 .. "; before: " .. oldTeamRating1 .. "; mmr: " .. matchMakingRating1 .. ").","PARTY")
	end
end)