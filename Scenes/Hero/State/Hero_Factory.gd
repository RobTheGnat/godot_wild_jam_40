class_name HeroFactory

var states

func _init():
	states = {
		"idle": HeroIdleState,
		"walk": HeroWalkState,
		"jump": HeroJumpState,
		"win" : HeroWinState,
		"fall": HeroFallState
}

func get_state(state_name) :
	if states.has(state_name):
		return states.get(state_name)
	else:
		printerr("No state ", state_name, " in state factory!")
	return null
