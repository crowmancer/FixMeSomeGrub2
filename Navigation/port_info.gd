extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func display(portDesc:String, pos:Vector2, isAvailable:bool = false):
	find_child("PortDesc").text = portDesc
	position = pos + Vector2(0,20)
	if(isAvailable):
		$BoxContainer/Button.visible = true;
	else:
		$BoxContainer/Button.visible = false;
