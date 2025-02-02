extends Node
@export var partHealths:Array[int] = []
@export var partSprites:Array[AnimatedSprite2D] = []
@export var partColliders:Array[CollisionShape2D] = []
@export var warningHealth:int = 30
@export var ShipHP:int = 300

var json:JSON = JSON.new()
var error = json.parse(FileAccess.open("res://PLAYER_DATA.json", FileAccess.READ).get_as_text())
static var PLAYERDATA

func _ready() -> void:
	if(error == OK):
		PLAYERDATA = json.data
		for i in range(len(partHealths)):
			partHealths[i] = PLAYERDATA["shipPartsHP"][i]
		ShipHP = PLAYERDATA["shipHP"]
	
		

func DamagePart(partNum, Dmg = 10):
	partHealths[partNum]-=Dmg
	if (partHealths[partNum]<=0):
		print("reached")
		partSprites[partNum].play("Destroyed")
		partHealths[partNum] = 0
		partColliders[partNum].set_deferred("disabled", true)
	elif (partHealths[partNum]<=warningHealth):
		print("WARN")
	print("ID: "+str(partNum)+" HP: "+str(partHealths[partNum]))
func Damage(dmg =10):
	var partsGone:int = 0
	for x in partHealths:
		if(x>=0):
			partsGone+=1
	if(partsGone==partHealths.size()):
		ShipHP-=dmg
		if(ShipHP<=0):
			print("u doed")
func Repair(partNum): #repairs the thing only if it can
	if(partHealths[partNum]>=0):
		partHealths[partNum]=100

func _exit_tree() -> void:
	PLAYERDATA["shipPartsHP"] = partHealths
	PLAYERDATA["shipHP"] = ShipHP
	var stringy:String = json.stringify(PLAYERDATA)
	var file = FileAccess.open("res://PLAYER_DATA.json",FileAccess.WRITE)
	file.store_string(stringy)
	file.close()
