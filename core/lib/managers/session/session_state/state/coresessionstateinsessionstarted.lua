slot3 = "CoreSessionStateInSessionStarted"

core.module(slot1, core)

slot3 = "CoreSessionStateQuitSession"

core.import(slot1, core)

slot3 = "CoreSessionStateInSessionEnd"

core.import(slot1, core)

InSessionStarted = InSessionStarted or class()
InSessionStarted.init = function (self, session)
	slot4 = session

	assert(slot3)

	self._session = session
	slot4 = self._session._session_handler

	self._session._session_handler.session_started(slot3)

	return 
end
InSessionStarted.destroy = function (self)
	return 
end
InSessionStarted.transition = function (self)
	slot3 = self.session_state._quit_session_requester

	if self.session_state._quit_session_requester.is_requested(slot2) then
		return CoreSessionStateQuitSession.Quit, self._session
	end

	if self._end_session then
		return CoreSessionStateInSessionEnd.InSessionEnd, self._session
	end

	return 
end
InSessionStarted.end_session = function (self)
	self._end_session = true

	return 
end

return 
