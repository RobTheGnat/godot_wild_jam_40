class_name HeroFactory

var states

func _init():
	states = {
		"idle": HeroIdleState,
		"walk": TowerAttackState,
		"jump": TowerGroundAttackState
}

func get_state(state_name) -> HeroState :
	if states.has(state_name):
		return states.get(state_name)
	else:
		printerr("No state ", state_name, " in state factory!")
	return null
