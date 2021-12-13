extends Node2D


func _ready():
	pass


func _on_StartGame_pressed():
	#var _error = get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
	$ColorRect.hide()
	Loading.load_scene("res://Scenes/Levels/Level1.tscn")
	
