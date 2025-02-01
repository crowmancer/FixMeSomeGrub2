extends CharacterBody2D


const SPEED :float = 300.0
const _halfPi :float = PI/2
const RAYLEN:int = 100
static var carryBox:bool = false;

func _physics_process(_delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * SPEED
	
	#change look at mouse to not be 90deg off
	look_at(get_global_mouse_position())
	rotate(_halfPi);
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if(event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
		#shoot raycast
		if(position.distance_to(get_global_mouse_position()) <=  RAYLEN):
			#maybe switch all this raycast stuff to actual raycast node????
			#it works for now so idc
			var space_state:PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
			var query = PhysicsRayQueryParameters2D.create(position,get_global_mouse_position(),0x2)
			var result = space_state.intersect_ray(query)
			if(!result.is_empty() && !carryBox):
				var hit = result.get("collider")
				hit.deleteSelf()
				carryBox = true
	elif (event is InputEventKey and event.keycode == KEY_Q and event.is_pressed()):
		if(carryBox):
			summonbox()
		
		
func summonbox():
	var space_state:PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(position,get_global_mouse_position(),0x2)
	var result = space_state.intersect_ray(query)
	if(!result):
		var boxInst = preload("res://ShipMode/cargoBox.tscn").instantiate()
		add_sibling(boxInst);
		boxInst.position = get_global_mouse_position();
		carryBox = false

	
