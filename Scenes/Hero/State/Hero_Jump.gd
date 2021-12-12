extends "res://Scenes/Hero/State/Hero_State.gd"

class_name HeroJumpState



func _ready():
	if animation_player != null:
		animation_player.play("jump")


var velocity = Vector2()



func _physics_process(delta): 
	# Vertical movement code. Apply gravity.
#	persistent_state.velocity.y += gravity * delta
	print (persistent_state.velocity.y)
	if (persistent_state.velocity.y >= 0):
		change_state.call_func("fall")

	# Move based on the velocity and snap to the ground.
	#velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

func move_up():
	persistent_state.velocity.y = -JUMP_SPEED
