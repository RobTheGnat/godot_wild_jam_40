extends HeroState

class_name HeroIdleState

func _ready():
	if animation_player != null:
		animation_player.play("idle")
		

func _physics_process(_delta):
	#persistent_state.velocity = move_and_slide_with_snap(persistent_state.velocity, Vector2.DOWN, Vector2.UP)
	#print(is_on_floor())
	#if not is_on_floor():
	#	change_state.call_func("fall")
	pass


func _flip_direction():
	persistent_state.get_node(state_name).flip_h = not persistent_state.get_node(state_name).flip_h

func move_left():
	if persistent_state.get_node(state_name).flip_h:
		change_state.call_func("walk")
	else:
		_flip_direction()

func move_right():
	if not persistent_state.get_node(state_name).flip_h:
		change_state.call_func("walk")
	else:
		_flip_direction()

func move_up():
	persistent_state.velocity.y = -JUMP_SPEED
	change_state.call_func("jump")
