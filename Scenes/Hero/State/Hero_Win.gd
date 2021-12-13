extends "res://Scenes/Hero/State/Hero_State.gd"

class_name HeroWinState


func _physics_process(_delta):
	persistent_state.velocity = Vector2.ZERO
