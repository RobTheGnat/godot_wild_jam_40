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
#onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	# Horizontal movement code. First, get the player's input.
	#var walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	# Slow down the player if they're not trying to move.
	#if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
	#	velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	#else:
	#	velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	#velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	#velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	#velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	print(is_on_floor())
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		state.move_up()

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	print(new_state_name)
	state = state_factory.get_state(new_state_name).new()
	state.setup(funcref(self, "change_state"), $AnimationPlayer, self)
	#state.name = new_state_name
	$Walk.set_visible(new_state_name == "walk")
	$Fall.set_visible(new_state_name == "fall")
	$Jump.set_visible(new_state_name == "jump")
	$Idle.set_visible(new_state_name == "idle")
	add_child(state)
