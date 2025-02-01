extends CharacterBody2D


const SPEED :float = 300.0
const halfPi :float = PI/2
const RAYLEN:int = 100

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * SPEED
	
	look_at(get_global_mouse_position())
	rotate(halfPi);
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if(event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
		#shoot raycast
		if(position.distance_to(get_global_mouse_position()) <=  RAYLEN):
			var space_state:PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
			var query = PhysicsRayQueryParameters2D.create(position,get_global_mouse_position(),0x2)
			var result = space_state.intersect_ray(query)
			if(!result.is_empty()):
				var hit = result.get("collider")
				hit.doThing()
