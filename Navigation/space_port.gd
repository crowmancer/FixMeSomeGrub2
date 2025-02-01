extends StaticBody2D

@export var nextPorts:Array[NodePath] = []
@export var portName:String = "Hoodwinker Spaceport"
@export var portDesc:String = "This is a spaceport"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#do the lines between the ports
	for port in nextPorts:
		var thisPort = get_node(port)
		var line = Line2D.new()
		add_child(line)
		line.add_point(to_local(position))
		line.add_point(to_local(thisPort.position))
		line.width = 3
		line.default_color = Color("#BEBEBE")
		
	#set the text string to the name of the port
	get_node("Name Label").text = portName


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
static var smallinfo
func _input_event(_viewport: Viewport, _event: InputEvent, _shape_idx: int) -> void:
	if(Input.is_action_just_pressed("left_mouse_click")):
		if(smallinfo):
			smallinfo.queue_free()
		smallinfo = preload("res://Navigation/portInfo.tscn").instantiate()
		add_sibling(smallinfo)
		smallinfo.display(portDesc,global_position)
