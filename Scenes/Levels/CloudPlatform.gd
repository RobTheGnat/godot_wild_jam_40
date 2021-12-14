tool 
extends Node2D

export var speed : float = 1
export var move_from : Vector2 = Vector2.ZERO
export var move_to : Vector2 = Vector2.ZERO

onready var line : Node2D = $DebugLine
onready var base : Node2D = $Platform
onready var tween : Tween = $Tween

var direction : bool = true

func _ready():
	if not Engine.is_editor_hint():
		process_tween()

func _process(_delta):
	if Engine.is_editor_hint():
		update()

func _draw():
	if Engine.is_editor_hint():
		if line:
			draw_line(line.position + move_from, line.position + move_to, Color.red, 2)
	

func set_tween(from, to):
	var _error = tween.interpolate_property(base, "position", from, to, speed, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	_error = tween.start()

func process_tween():
	if direction:
		set_tween(move_from, move_to)
	else:
		set_tween(move_to, move_from)
	direction = !direction

func _on_Tween_tween_completed(_object, _key):
	process_tween()
