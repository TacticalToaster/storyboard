--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("MeD");

COMMAND.tip = "CmdMeD";
COMMAND.text = "CmdMeDDesc";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_DEATHCODE);

COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local text = table.concat(arguments, " ");
	local playerEye = Player:GetEyeTrace()

	if (text == "") then
		Clockwork.player:Notify(player, {"NotEnoughText"});

		return;
	end;

	if (playerEye.Entity and playerEye.Entity:IsPlayer()) then
		self:Add({playerEye.Entity}, player, "me", string.gsub(text, "^.", string.lower));
	else
		Clockwork.player:Notify(player, {"MustLookAtValidTarget"});
	end;
end;

COMMAND:Register();
