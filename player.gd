extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionLR :float = Input.get_axis("ui_left", "ui_right")
	var directionUD :float = Input.get_axis("ui_up","ui_down");
	if directionLR:
		velocity.x = directionLR * SPEED;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED);
		
	
	if directionUD:
		velocity.y = directionUD * SPEED;
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED);
	
	move_and_slide()
