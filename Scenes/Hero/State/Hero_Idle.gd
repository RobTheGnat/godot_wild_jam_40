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
	animation_player.flip_h = not animation_player.flip_h

func move_left():
	if animation_player.flip_h:
		change_state.call_func("walk")
	else:
		_flip_direction()

func move_right():
	if not animation_player.flip_h:
		change_state.call_func("walk")
	else:
		_flip_direction()

func move_up():
	change_state.call_func("jump")
