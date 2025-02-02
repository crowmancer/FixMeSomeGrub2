extends Node

@export var partNum:int

func hitter(dmg):
	$"..".DamagePart(partNum,dmg)
