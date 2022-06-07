local Clockwork = Clockwork;

Clockwork.config:AddToSystem("ObserverReset", "observer_reset", "ObserverResetDesc", true);

cwObserverMode.IsObserving = false;

Clockwork.datastream:Hook("ObserverStart", function(data)
	cwObserverMode.IsObserving = true;
end);

Clockwork.datastream:Hook("ObserverEnd", function(data)
	cwObserverMode.IsObserving = false;
end);

Clockwork.datastream:Hook("ObserverToggle", function(data)
	cwObserverMode.IsObserving = !cwObserverMode.IsObserving;
end);