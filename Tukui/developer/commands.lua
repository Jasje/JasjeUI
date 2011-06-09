-- a command to show frame you currently have mouseovered
SLASH_FRAME1 = "/frame"
SlashCmdList["FRAME"] = function(arg)
	if arg ~= "" then
		arg = _G[arg]
	else
		arg = GetMouseFocus()
	end
	if arg ~= nil and arg:GetName() ~= nil then
		local point, relativeTo, relativePoint, xOfs, yOfs = arg:GetPoint()
		ChatFrame1:AddMessage(hexa.."~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		ChatFrame1:AddMessage(hexa.."Name: "..hexb..arg:GetName())
		if arg:GetParent() then
			ChatFrame1:AddMessage(hexa.."Parent: "..hexb..arg:GetParent():GetName())
		end
 
		ChatFrame1:AddMessage(hexa.."Width: "..hexb..format("%.2f",arg:GetWidth()))
		ChatFrame1:AddMessage(hexa.."Height: "..hexb..format("%.2f",arg:GetHeight()))
		ChatFrame1:AddMessage(hexa.."Strata: "..hexb..arg:GetFrameStrata())
		ChatFrame1:AddMessage(hexa.."Level: "..hexb..arg:GetFrameLevel())
 
		if xOfs then
			ChatFrame1:AddMessage(hexa.."X: "..hexb..format("%.2f",xOfs))
		end
		if yOfs then
			ChatFrame1:AddMessage(hexa.."Y: "..hexb..format("%.2f",yOfs))
		end
		if relativeTo then
			ChatFrame1:AddMessage(hexa.."Point: "..hexb..point.." anchored to "..relativeTo:GetName().."'s "..hexa..relativePoint)
		end
		ChatFrame1:AddMessage(hexa.."~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	elseif arg == nil then
		ChatFrame1:AddMessage(hexa.."Invalid frame name")
	else
		ChatFrame1:AddMessage(hexa.."Could not find frame info")
	end
end

-- enable lua error by command
function SlashCmdList.LUAERROR(msg, editbox)
	if (msg == 'on') then
		SetCVar("scriptErrors", 1)
		-- because sometime we need to /rl to show an error on login.
		ReloadUI()
	elseif (msg == 'off') then
		SetCVar("scriptErrors", 0)
	else
		print("/luaerror on - /luaerror off")
	end
end
SLASH_LUAERROR1 = '/luaerror'

SLASH_TESTARENA1 = "/testarena"
SlashCmdList["TESTARENA"] = function()
	for _, frames in pairs({"TukuiArena1", "TukuiArena2", "TukuiArena3", "TukuiArena4"}) do
        _G[frames].Hide = function() end
        _G[frames]:Show()
        _G[frames].unit = "player"
	end
end

local mes = function(msg)
	print("|cffFF6347-|r", tostring(msg))
end