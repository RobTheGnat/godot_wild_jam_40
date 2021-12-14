extends Node2D


func _ready():
	var camera : Camera2D = $Camera2D
	camera.current = true
	camera.drag_margin_v_enabled = true
	camera.smoothing_enabled = true
	camera.smoothing_speed = 4
	camera.drag_margin_top = .4
	#pass


func _on_Objective_objective_reacted():
	Loading.load_scene("res://Scenes/MainGame.tscn")
