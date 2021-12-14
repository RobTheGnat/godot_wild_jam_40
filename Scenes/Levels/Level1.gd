extends Node2D


func _ready():
	var camera : Camera2D = $Camera2D
	camera.current = true
	camera.drag_margin_v_enabled = true
	camera.smoothing_enabled = true
	camera.smoothing_speed = 4
	camera.drag_margin_top = .4


func _on_Node2D_objective_reacted():
	#var _error = get_tree().change_scene("res://Scenes/Levels/Level2.tscn")
	Loading.load_scene("res://Scenes/Levels/Level2.tscn")
#	print("Done here")
