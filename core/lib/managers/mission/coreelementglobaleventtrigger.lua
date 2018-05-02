slot3 = "CoreElementGlobalEventTrigger"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

if not ElementGlobalEventTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementGlobalEventTrigger = slot0
ElementGlobalEventTrigger.client_on_executed = function (self, ...)
	return 
end
ElementGlobalEventTrigger.init = function (self, ...)
	slot3 = self

	ElementGlobalEventTrigger.super.init(slot2, ...)

	return 
end
ElementGlobalEventTrigger.on_script_activated = function (self)
	slot6 = self
	slot5 = {
		self._values.global_event
	}
	slot12 = Network
	slot10 = (Network.is_client(slot11) and "send_to_host") or "on_executed"

	managers.mission.add_global_event_listener(slot2, managers.mission, self._unique_string_id(slot5), callback(slot7, self, self))

	return 
end
ElementGlobalEventTrigger.send_to_host = function (self, instigator)
	if instigator then
		slot4 = managers.network
		slot8 = instigator

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "to_server_mission_element_trigger", self._sync_id, self._id)
	end

	return 
end
ElementGlobalEventTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementGlobalEventTrigger.super.on_executed(slot3, self)

	return 
end
ElementGlobalEventTrigger.pre_destroy = function (self)
	slot3 = managers.mission
	slot6 = self

	managers.mission.remove_global_event_listener(slot2, self._unique_string_id(slot5))

	return 
end

return 
