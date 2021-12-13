extends Node2D


func _ready():
	pass


func _on_Objective_objective_reacted():
	Loading.load_scene("res://Scenes/Levels/Level3.tscn")
