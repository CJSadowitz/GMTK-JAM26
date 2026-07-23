extends CharacterBody2D

var speed = 500

func _physics_process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	
	velocity = position.direction_to(mouse) * speed
	look_at(mouse)
	
	if position.distance_to(mouse) > 20:
		move_and_slide()
