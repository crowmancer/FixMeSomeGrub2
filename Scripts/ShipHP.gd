extends Node
@export var partHealths:Array[int] = []
@export var partSprites:Array[AnimatedSprite2D] = []
@export var partColliders:Array[CollisionShape2D] = []
@export var warningHealth:int = 30
@export var ShipHP:int = 300

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

	
