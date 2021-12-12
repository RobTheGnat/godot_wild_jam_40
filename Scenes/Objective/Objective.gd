extends Area2D

signal objective_reacted

func _on_Node2D_body_entered(_body):
	emit_signal("objective_reacted")
