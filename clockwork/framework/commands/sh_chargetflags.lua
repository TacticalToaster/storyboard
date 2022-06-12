local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("CharGetFlags");

COMMAND.tip = "CmdCharGetFlags";
COMMAND.text = "CmdCharGetFlagsDesc";
COMMAND.access = "s";
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local flags = "";
	local flagTable = Clockwork.flag:GetStored();
    local target = arguments[1];

	for flag, _v in pairs(flagTable) do
		flags = flags..flag;
	end;

    if (!target) then
        Clockwork.player:GiveFlags(player, flags);
    elseif (target) then
        if (target:IsUserGroup("operator") do
            Clockwork.player:GiveFlags(target, Clockwork.config:Get("op_flags"):Get())
            Clockwork.player:NotifyAdmins("o", {"PlayerGavePlayerFlags", player:Name(), target:Name(), Clockwork.config:Get("op_flags"):Get()});
        elseif (target:IsAdmin()) do
            Clockwork.player:GiveFlags(target, Clockwork.config:Get("admin_flags"):Get())
            Clockwork.player:NotifyAdmins("o", {"PlayerGavePlayerFlags", player:Name(), target:Name(), Clockwork.config:Get("admin_flags"):Get()});
        elseif (target:IsSuperAdmin()) do
            Clockwork.player:GiveFlags(target, flags);
            Clockwork.player:NotifyAdmins("o", {"PlayerGavePlayerFlags", player:Name(), target:Name(), flags});
        else
            Clockwork.player:GiveFlags(target, "pet");
            Clockwork.player:NotifyAdmins("o", {"PlayerGavePlayerFlags", player:Name(), target:Name(), "pet"});
        end;
    else
        Clockwork.player:Notify(player, {"NotValidCharacter", arguments[1]});
    end;
end;

COMMAND:Register();
