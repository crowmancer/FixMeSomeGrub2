extends Node
@export var partHealths:Array[int] = []
@export var partSprites:Array[AnimatedSprite2D] = []
@export var partColliders:Array[CollisionShape2D] = []
@export var warningHealth:int = 30
@export var ShipHP:int = 300

func DamagePart(partNum, Damage = 10):
	partHealths[partNum]-=Damage
	if (partHealths[partNum]<=0):
		partSprites[partNum].play("Destroy")
		partHealths[partNum] = 0
		partColliders[partNum].disabled = true
	elif (partHealths[partNum]<=warningHealth):
		print("WARN")
func Damage(Damage =10):
	var partsGone:int = 0
	for x in partHealths:
		if(partHealths[x]>=0):
			partsGone+=1
	if(partsGone==partHealths.size()):
		ShipHP-=Damage
		if(ShipHP<=0):
			print("u doed")
func Repair(partNum): #repairs the thing only if it can
	if(partHealths[partNum]>=0):
		partHealths[partNum]=100

	
