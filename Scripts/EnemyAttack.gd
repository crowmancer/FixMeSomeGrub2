extends Area2D

func _on_area_entered(body):
	if (body.is_in_group("Ship")):
		body.hitter(10)
		queue_free()
