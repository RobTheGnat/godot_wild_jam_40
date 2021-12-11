extends Node2D


func _ready():
	pass


func _on_StartGame_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
