if not NpcVehicleStateManeuverBackRight then
	slot2 = NpcVehicleStateManeuver
	slot0 = class(slot1)
end

NpcVehicleStateManeuverBackRight = slot0
NpcVehicleStateManeuverBackRight.init = function (self, unit)
	slot5 = unit

	NpcBaseVehicleState.init(slot3, self)

	return 
end
NpcVehicleStateManeuverBackRight.on_enter = function (self, npc_driving_ext)
	slot5 = npc_driving_ext

	NpcVehicleStateManeuverBackRight.super.on_enter(slot3, self)

	slot4 = Application
	local delayed_tick = Application.time(slot3) + 0.5
	self._maneuver_actions = {
		{
			duration = 1,
			tick_at = delayed_tick,
			input = {
				handbrake = 0,
				acceleration = 1,
				brake = 0,
				steering = NpcVehicleDrivingExt.DRIVE_CONTROLS_STEER_FULL_LEFT,
				gear = NpcVehicleDrivingExt.DRIVE_CONTROLS_GEAR_REVERSE
			}
		},
		{
			duration = 1,
			tick_at = 0,
			input = {
				handbrake = 0,
				acceleration = 1,
				brake = 0,
				steering = NpcVehicleDrivingExt.DRIVE_CONTROLS_STEER_STRAIGHT,
				gear = NpcVehicleDrivingExt.DRIVE_CONTROLS_GEAR_FIRST
			}
		}
	}
	self._current_maneuver_action_idx = 1
	local current_action = self._maneuver_actions[self._current_maneuver_action_idx]

	return 
end
NpcVehicleStateManeuverBackRight.update = function (self, npc_driving_ext, t, dt)
	local current_action = self._maneuver_actions[self._current_maneuver_action_idx]

	if current_action then
		if current_action.tick_at < t and t < current_action.tick_at + current_action.duration then
			slot14 = current_action.input.gear

			npc_driving_ext.set_input(slot6, npc_driving_ext, current_action.input.acceleration, current_action.input.steering, current_action.input.brake, current_action.input.handbrake, false, false)
		elseif current_action.tick_at < t then
			self._current_maneuver_action_idx = self._current_maneuver_action_idx + 1
			current_action = self._maneuver_actions[self._current_maneuver_action_idx]

			if current_action then
				current_action.tick_at = t + current_action.duration
			end
		end
	end

	return 
end
NpcVehicleStateManeuverBackRight.name = function (self)
	return NpcVehicleDrivingExt.STATE_MANEUVER_BACK_RIGHT
end
NpcVehicleStateManeuverBackRight.change_state = function (self, npc_driving_ext)
	if not self._maneuver_actions[self._current_maneuver_action_idx] then
		slot5 = NpcVehicleDrivingExt.STATE_PURSUIT

		npc_driving_ext.set_state(slot3, npc_driving_ext)
	end

	return 
end
NpcVehicleStateManeuverBackRight.is_maneuvering = function (self)
	return true
end

return 
