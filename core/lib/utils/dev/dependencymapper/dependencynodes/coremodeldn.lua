slot3 = "CoreModelDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

MODEL = CoreDependencyNode.MODEL

if not ModelDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

ModelDependencyNode = slot0
ModelDependencyNode.init = function (self, name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, MODEL, "model", name, get_dn_cb)

	return 
end
ModelDependencyNode._parse = function (self)
	return {}
end

return 
