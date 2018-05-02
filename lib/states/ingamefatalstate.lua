slot2 = "lib/states/GameState"

require(slot1)

if not IngameFatalState then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameFatalState = slot0
function IngameFatalState:init(game_state_machine)
	slot6 = game_state_machine

	IngameFatalState.super.init(slot3, self, "ingame_fatal")

	return 
end
IngameFatalState.on_local_player_dead = function ()
	slot2 = managers.network
	slot2 = managers.network.session(slot1)
	local peer_id = managers.network.session(slot1).local_peer(slot1).id(slot1)
	local player = managers.player.player_unit(managers.network.session(slot1).local_peer(slot1))
	slot4 = player
	slot9 = player
	slot7 = player.character_damage(slot8).down_time(slot8)
	slot10 = player

	player.network(managers.player).send(managers.player, player.network(managers.player), "sync_player_movement_state", "dead", player.id(player.character_damage(slot8)))

	slot4 = managers.groupai
	slot5 = peer_id

	managers.groupai.state(managers.player).on_player_criminal_death(managers.player, managers.groupai.state(managers.player))

	return 
end
function IngameFatalState:update(t, dt)
	local player = managers.player.player_unit(slot4)
	slot6 = player

	if not alive(managers.player) then
		return 
	end

	slot6 = player
	slot8 = dt

	if player.character_damage(slot5).update_downed(slot5, player.character_damage(slot5), t) then
		slot6 = managers.player

		managers.player.force_drop_carry(slot5)

		slot7 = {
			death = true
		}

		managers.statistics.downed(slot5, managers.statistics)
		IngameFatalState.on_local_player_dead()

		slot7 = "ingame_waiting_for_respawn"

		game_state_machine.change_state_by_name(slot5, game_state_machine)

		slot6 = player
		slot7 = true

		player.character_damage(slot5).set_invulnerable(slot5, player.character_damage(slot5))

		slot6 = player
		slot7 = 0

		player.character_damage(slot5).set_health(slot5, player.character_damage(slot5))

		slot6 = player
		slot6 = player.base(slot5)

		player.base(slot5)._unregister(slot5)

		slot7 = player

		World.delete_unit(slot5, World)
	end

	return 
end
function IngameFatalState:at_enter()
	local players = managers.player.players(slot2)
	slot4 = players

	for k, player in ipairs(managers.player) do
		slot9 = player
		slot9 = player.camera(slot8)
		local vp = player.camera(slot8).viewport(slot8)

		if vp then
			slot11 = true

			vp.set_active(slot9, vp)
		else
			slot14 = k
			slot11 = "No viewport for player " .. tostring(slot13)

			Application.error(slot9, Application)
		end
	end

	slot5 = {
		fatal = true
	}

	managers.statistics.downed(slot3, managers.statistics)

	slot4 = managers.player
	local player = managers.player.player_unit(slot3)

	if player then
		slot5 = player
		slot6 = true

		player.base(slot4).set_enabled(slot4, player.base(slot4))
	end

	slot6 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.show(slot4, managers.hud)

	slot6 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.show(slot4, managers.hud)

	return 
end
function IngameFatalState:at_exit()
	slot3 = managers.player
	local player = managers.player.player_unit(slot2)

	if player then
		slot4 = player
		slot5 = false

		player.base(slot3).set_enabled(slot3, player.base(slot3))
	end

	slot5 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.hide(slot3, managers.hud)

	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.hide(slot3, managers.hud)

	return 
end

return 
