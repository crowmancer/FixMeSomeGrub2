extends Node2D

var json:JSON = JSON.new()
var error = json.parse(FileAccess.open("res://PLAYER_DATA.json", FileAccess.READ).get_as_text())
static var PLAYERDATA
static var currentMoney:int = 0
static var maxMoneyNeeded:int = 1_000_000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(error == OK):
		PLAYERDATA = json.get_data()
		var currentStation = find_child(PLAYERDATA["currentStation"])
		currentStation.mark() #mark as the player being at this port
		if(!PLAYERDATA["starting"]):
			currentMoney = PLAYERDATA["money"]
			var cargoLeft:int = PLAYERDATA["cargo"]
			var cargoWorth:int = 20 #temp value
			var profit:int = cargoLeft * cargoWorth
			currentMoney += profit
			#Do GUI alert to how much was made
		$MoneyLabel.text = "£"+ str(currentMoney) + " / £"+str(maxMoneyNeeded)
	else:
		OS.alert("Something went wrong with parsing game data!")
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
