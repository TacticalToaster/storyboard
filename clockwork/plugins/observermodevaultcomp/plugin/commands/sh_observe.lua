--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local COMMAND = Clockwork.command:New("Observe");

COMMAND.tip = "Turn on or off admin ESP while not in observer/noclip.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (player:Alive() and !player:IsRagdolled()) then
		if (player.cwObserverMode) then
			Clockwork.player:Notify(player, "You're already in observer mode. This command is for when you're out of observer mode and want to use admin ESP!")
		else
			Clockwork.datastream:Start(player, "ObserverToggle");
			Clockwork.player:Notify(player, "Admin ESP toggled.");
		end;
	end;
end;

COMMAND:Register();