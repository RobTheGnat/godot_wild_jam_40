extends Node2D

class_name HeroState

func setup(pass_change_state, pass_animation_player, pass_persistent_state):
	self.change_state = pass_change_state
	self.animation_player = pass_animation_player
	self.persistent_state = pass_persistent_state

