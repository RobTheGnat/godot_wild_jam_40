extends "res://Scenes/Hero/State/Hero_State.gd"

class_name HeroWalkState

var friction : int = .03
const min_move_speed = 0.005
const WALK_FORCE = 600
const WALK_MAX_SPEED = 200


func _ready():
	$Walk.set_visible(true)
	$Fall.set_visible(false)
	$Jump.set_visible(false)
	$Idle.set_visible(false)
	if animation_player != null:
		animation_player.play("walk")

func _physics_process(_delta):
	if abs(persistent_state.velocity.x) < min_move_speed:
		 change_state.call_func("idle")
	persistent_state.velocity.x *= friction
	# Clamp to the maximum horizontal movement speed.
	#velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

func move_left():
	if $Walk.flip_h:
		persistent_state.velocity += WALK_FORCE
		persistent_state.velocity.x = clamp(persistent_state.velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	else:
		change_state.call_func("idle")

func move_right():
	if not $Walk.flip_h:
		persistent_state.velocity += WALK_FORCE
		persistent_state.velocity.x = clamp(persistent_state.velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	else:
		change_state.call_func("idle")
