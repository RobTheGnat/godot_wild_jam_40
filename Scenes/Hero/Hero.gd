extends KinematicBody2D

const WALK_FORCE = 600
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
const JUMP_SPEED = 350

var state
var state_factory : HeroFactory

var velocity = Vector2()

func _ready():
	state_factory = HeroFactory.new()
	change_state("fall")

func _physics_process(_delta):
	if Input.is_action_pressed('ui_right'):
		state.move_right()

	if Input.is_action_pressed('ui_left'):
		state.move_left()
	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		state.move_up()

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_factory.get_state(new_state_name).new()
	state.setup(funcref(self, "change_state"), $AnimationPlayer, self)
	state.state_name = new_state_name
	$walk.set_visible(new_state_name == "walk")
	$fall.set_visible(new_state_name == "fall")
	$jump.set_visible(new_state_name == "jump")
	$idle.set_visible(new_state_name == "idle")
	add_child(state)
