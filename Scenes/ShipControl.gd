extends CharacterBody2D

const HALF_PI: float = PI/2
@export var cursor_smooth: Node2D
@export var smoothness: float = 1.5
@export var speed = 400.0

func get_input():
	if Input.is_action_pressed("Forward"):
		velocity = transform.x * speed
	else:
		velocity = Vector2(0,0)

func _process(delta: float) -> void:
	cursor_smooth.global_position = cursor_smooth.global_position.lerp(
		get_global_mouse_position(), 
		clamp(smoothness * delta, 0, 1)  
	)
	
	var target_angle = (cursor_smooth.global_position - global_position).angle()
	rotation = lerp_angle(rotation, target_angle, clamp(smoothness * delta, 0, 1))
	
	get_input()
	move_and_slide()
