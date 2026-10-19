local commands = { "quickshell", "hypridle", "zlaunch", "hyprpaper", "elephant", "walker --gapplication-service" }

hl.on("hyprland.start", function()
	for i, command in pairs(commands) do
		hl.exec_cmd(command)
	end
end)
