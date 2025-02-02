extends Node2D

@export var partHealths:Array[int] = []
@export var warningHealth:int = 30
@export var ShipHP:int = 300
@export var roomNodes: Array[NodePath] = []


var json:JSON = JSON.new()
var error = json.parse(FileAccess.open("res://PLAYER_DATA.json", FileAccess.READ).get_as_text())
static var PLAYERDATA

func _ready() -> void:
	if(error == OK):
		PLAYERDATA = json.data
		for i in range(len(PLAYERDATA["shipPartsHP"])):
			partHealths[i] = int(PLAYERDATA["shipPartsHP"][i])
			if(partHealths[i] < 0):
				var room:Node = get_node(roomNodes[i])
				var collider:Node = room.find_child("CollisionShape2D")
				var area:Node = room.find_child("Area2D")
				var killingdaboxes = area.get_overlapping_bodies()
				room.visible = true
				collider.disabled = false
				for body in killingdaboxes:
					body.deleteself()
		ShipHP = PLAYERDATA["shipHP"]
