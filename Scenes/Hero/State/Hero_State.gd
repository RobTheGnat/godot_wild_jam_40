extends KinematicBody2D

class_name HeroState

var change_state
var animation_player
var persistent_state
var state_name
const WALK_MAX_SPEED = 100
var friction = .3
const min_move_speed = 0.005
const WALK_FORCE = 600
var audio_stream : AudioStreamPlayer2D = null

onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const JUMP_SPEED = 350

func _physics_process(delta):
	persistent_state.velocity.x *= friction
	persistent_state.velocity.y += gravity * delta
	persistent_state.velocity.x = clamp(persistent_state.velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	persistent_state.velocity = persistent_state.move_and_slide_with_snap(persistent_state.velocity, Vector2.DOWN, Vector2.UP)


func setup(pass_change_state, pass_animation_player, pass_persistent_state, audio):
	self.change_state = pass_change_state
	self.animation_player = pass_animation_player
	self.persistent_state = pass_persistent_state
	self.audio_stream = audio

func stop_animation():
	animation_player.stop()

func _flip_direction():
	persistent_state.get_node(state_name).flip_h = not persistent_state.get_node(state_name).flip_h


func move_left():
	if persistent_state.get_node(state_name).flip_h:
		persistent_state.velocity.x -= WALK_FORCE
	else:
		_flip_direction()
		#persistent_state.velocity.x = clamp(persistent_state.velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

func move_right():
	if not persistent_state.get_node(state_name).flip_h:
		persistent_state.velocity.x += WALK_FORCE
	else:
		_flip_direction()
		#persistent_state.velocity.x = clamp(persistent_state.velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	
func move_up():
	pass

func get_flip_h() -> bool:
	return persistent_state.get_node(state_name).flip_h
