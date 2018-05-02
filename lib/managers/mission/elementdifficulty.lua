slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementDifficulty then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementDifficulty = slot0
ElementDifficulty.init = function (self, ...)
	slot3 = self

	ElementDifficulty.super.init(slot2, ...)

	return 
end
ElementDifficulty.client_on_executed = function (self, ...)
	return 
end
ElementDifficulty.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.groupai
	slot8 = managers.enemy
	slot5 = self._values.difficulty + managers.enemy.commander_difficulty(slot7)

	managers.groupai.state(slot3).set_difficulty(slot3, managers.groupai.state(slot3))

	slot5 = instigator

	ElementDifficulty.super.on_executed(slot3, self)

	return 
end

return 
