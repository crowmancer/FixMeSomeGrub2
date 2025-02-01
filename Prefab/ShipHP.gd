extends Node

@export var partHealths:Array[int] = []
@export var partSprites:Array[AnimatedSprite2D] = []
@export var partColliders:Array[CollisionShape2D] = []
@export var warningHealth:int = 30

func Damage(partNum, Damage = 10):
	partHealths[partNum]-=Damage
	if (partHealths[partNum]<=0):
		partSprites[partNum].play("Destroy")
		partHealths[partNum] = 0
		partColliders[partNum].disabled = true
	elif (partHealths[partNum]<=warningHealth):
		print("WARN")
	
func Repair(partNum): #repairs the thing only if it can
	if(partHealths[partNum]>=0):
		partHealths[partNum]=100

	
