extends Node2D

var json:JSON = JSON.new()
var error = json.parse(FileAccess.open("res://PLAYER_DATA.json", FileAccess.READ).get_as_text())
var PLAYERDATA
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(error == OK):
		PLAYERDATA = json.get_data()
		var currentStation = find_child(PLAYERDATA["currentStation"])
		currentStation.mark()
	else:
		OS.alert("Something went wrong with parsing game data!")
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
