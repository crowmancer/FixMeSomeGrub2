extends Sprite2D

var canYap : bool = true

func _ready() -> void:
	Dialogic.signal_event.connect(DialogicSignal)
	

func _on_timer_timeout() -> void:
	if canYap:
		if Dialogic.current_state == 1:
			if $".".texture == load("res://Dialogue Stuff/open.png"):
				$".".texture = load("res://Dialogue Stuff/closed.png")
			else:
				$".".texture = load("res://Dialogue Stuff/open.png")
				
		else:
			$".".texture = load("res://Dialogue Stuff/closed.png")

func DialogicSignal(argument:String) -> void:
	if argument == "yap":
		canYap = true
	if argument == "noyap":
		canYap = false
