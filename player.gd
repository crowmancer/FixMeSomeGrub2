extends CharacterBody2D


const SPEED :float = 300.0
const halfPi :float = PI/2

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * SPEED
	
	look_at(get_global_mouse_position())
	rotate(halfPi);
	
	move_and_slide()
