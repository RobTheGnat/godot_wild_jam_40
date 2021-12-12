extends HeroState

class_name HeroFallState


func _physics_process(delta): 
	#print("fall")
	persistent_state.velocity.y += gravity * delta
	print (persistent_state.is_on_floor())
	if persistent_state.is_on_floor():
		change_state.call_func("idle")
	
	
