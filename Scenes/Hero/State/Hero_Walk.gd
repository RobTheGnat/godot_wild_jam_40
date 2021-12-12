extends "res://Scenes/Hero/State/Hero_State.gd"

class_name HeroWalkState



func _ready():
	if animation_player != null:
		animation_player.play("walk")

func _physics_process(_delta):
	print(persistent_state.velocity.x)
	if abs(persistent_state.velocity.x) <= 0.1:
		print("chagne ifld")
		change_state.call_func("idle")

func move_up():
	persistent_state.velocity.y = -JUMP_SPEED
	change_state.call_func("jump")

