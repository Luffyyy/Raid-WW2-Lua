slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementAccessCamera then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAccessCamera = slot0
ElementAccessCamera.init = function (self, ...)
	slot3 = self

	ElementAccessCamera.super.init(slot2, ...)

	self._camera_unit = nil
	self._triggers = {}

	return 
end
ElementAccessCamera.on_script_activated = function (self)
	if self._values.camera_u_id then
		local id = self._values.camera_u_id
		local unit = nil

		if false then
			slot6 = id
			unit = managers.editor.unit_with_id(slot4, managers.editor)
		else
			slot5 = self._mission_script
			slot6 = id
			slot11 = "_load_unit"
			unit = self._mission_script.worlddefinition(slot4).get_unit_on_load(slot4, self._mission_script.worlddefinition(slot4), callback(slot8, self, self))
		end

		if unit then
			slot5 = unit
			slot6 = self

			unit.base(slot4).set_access_camera_mission_element(slot4, unit.base(slot4))

			self._camera_unit = unit
		end
	end

	self._has_fetched_units = true
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
ElementAccessCamera._load_unit = function (self, unit)
	slot4 = unit
	slot5 = self

	unit.base(slot3).set_access_camera_mission_element(slot3, unit.base(slot3))

	self._camera_unit = unit

	return 
end
ElementAccessCamera.client_on_executed = function (self, ...)
	return 
end
ElementAccessCamera.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementAccessCamera.super.on_executed(slot3, self)

	return 
end
ElementAccessCamera.access_camera_operation_destroy = function (self)
	self._values.destroyed = true
	slot4 = "destroyed"

	self.check_triggers(true, self)

	return 
end
ElementAccessCamera.add_trigger = function (self, id, type, callback)
	self._triggers[type] = self._triggers[type] or {}
	self._triggers[type][id] = {
		callback = callback
	}

	return 
end
ElementAccessCamera.remove_trigger = function (self, id, type)
	if self._triggers[type] then
		self._triggers[type][id] = nil
	end

	return 
end
ElementAccessCamera.trigger_accessed = function (self, instigator)
	slot4 = Network

	if Network.is_client(slot3) then
		slot4 = managers.network
		slot9 = instigator

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "to_server_access_camera_trigger", self._sync_id, self._id, "accessed")
	else
		slot6 = instigator

		self.check_triggers(slot3, self, "accessed")
	end

	return 
end
ElementAccessCamera.check_triggers = function (self, type, instigator)
	if not self._triggers[type] then
		return 
	end

	slot5 = self._triggers[type]

	for id, cb_data in pairs(slot4) do
		slot10 = instigator

		cb_data.callback(slot9)
	end

	return 
end
ElementAccessCamera.enabled = function (self, ...)
	slot3 = self._camera_unit

	if alive(slot2) then
		slot3 = self._camera_unit

		return self._camera_unit.enabled(slot2)
	end

	slot3 = self

	return ElementAccessCamera.super.enabled(slot2, ...)
end
ElementAccessCamera.has_camera_unit = function (self)
	slot3 = self._camera_unit

	return (alive(slot2) and true) or false
end
ElementAccessCamera.camera_unit = function (self)
	slot3 = self._camera_unit

	if alive(slot2) then
		return self._camera_unit
	end

	return nil
end
ElementAccessCamera.camera_position = function (self)
	slot3 = self._camera_unit

	if alive(slot2) then
		slot3 = self._camera_unit
		slot6 = "CameraLens"
		slot3 = self._camera_unit.get_object(slot2, Idstring(slot5))

		return self._camera_unit.get_object(slot2, Idstring(slot5)).position(slot2)
	end

	slot4 = "position"

	return self.value(slot2, self)
end
ElementAccessCamera.save = function (self, data)
	data.enabled = self._values.enabled
	data.destroyed = self._values.destroyed

	return 
end
ElementAccessCamera.load = function (self, data)
	slot5 = data.enabled

	self.set_enabled(slot3, self)

	self._values.destroyed = data.destroyed

	if not self._has_fetched_units then
		slot4 = self

		self.on_script_activated(slot3)
	end

	return 
end

if not ElementAccessCameraOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAccessCameraOperator = slot0
ElementAccessCameraOperator.init = function (self, ...)
	slot3 = self

	ElementAccessCameraOperator.super.init(slot2, ...)

	return 
end
ElementAccessCameraOperator.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementAccessCameraOperator.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element and self._values.operation == "destroy" then
			slot10 = element

			element.access_camera_operation_destroy(slot9)
		end
	end

	slot5 = instigator

	ElementAccessCameraOperator.super.on_executed(slot3, self)

	return 
end

if not ElementAccessCameraTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAccessCameraTrigger = slot0
ElementAccessCameraTrigger.init = function (self, ...)
	slot3 = self

	ElementAccessCameraTrigger.super.init(slot2, ...)

	return 
end
ElementAccessCameraTrigger.on_script_activated = function (self)
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot11 = self._values.trigger_type
		slot16 = "on_executed"

		element.add_trigger(self, element, self._id, callback(slot13, self, self))
	end

	return 
end
ElementAccessCameraTrigger.client_on_executed = function (self, ...)
	return 
end
ElementAccessCameraTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementAccessCameraTrigger.super.on_executed(slot3, self)

	return 
end

return 
