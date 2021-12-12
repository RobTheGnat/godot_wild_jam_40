extends KinematicBody2D

class_name HeroState

var change_state
var animation_player
var persistent_state

onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	print("state")
	persistent_state.velocity = persistent_state.move_and_slide(persistent_state.velocity, Vector2.UP)


func setup(pass_change_state, pass_animation_player, pass_persistent_state):
	self.change_state = pass_change_state
	self.animation_player = pass_animation_player
	self.persistent_state = pass_persistent_state

func stop_animation():
	animation_player.stop()

func move_left():
	pass

func move_right():
	pass
	
func move_up():
	pass
