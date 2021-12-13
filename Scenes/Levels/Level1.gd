extends Node2D




func _on_Node2D_objective_reacted():
	#var _error = get_tree().change_scene("res://Scenes/Levels/Level2.tscn")
	Loading.load_scene("res://Scenes/Levels/Level2.tscn")
#	print("Done here")
