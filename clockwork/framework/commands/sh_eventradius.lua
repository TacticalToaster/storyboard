--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("EventRadius");

COMMAND.tip = "CmdEventRadius";
COMMAND.text = "CmdEventRadiusDesc";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local radius = tonumber(arguments[1]);

	if (radius) then
		local text = table.concat(arguments, " ", 2);

		Clockwork.chatBox:AddInRadius(player, "event",  text, player:GetPos(), radius);
	else
		Clockwork.player:Notify(player, {"NotValidRadius", arguments[1]});
	end;
end;

COMMAND:Register();
