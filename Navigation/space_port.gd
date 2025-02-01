extends StaticBody2D

@export var nextPorts = []
@export var portName:String = "Hoodwinker Spaceport"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for port in nextPorts:
		var thisPort = get_node(port)
		var line = Line2D.new()
		add_child(line)
		line.add_point(to_local(position))
		line.add_point(to_local(thisPort.position))
		line.width = 3
		line.default_color = Color("#BEBEBE")
	get_node("Name Label").text = portName


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
