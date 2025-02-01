extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.snappedf(16)


func doThing():
	position.x -= 16
	position.y += 16
	position = position.snappedf(32)
	position.x += 16
	position.y -= 16
