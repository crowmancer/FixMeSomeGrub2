extends Control

func display(portDesc:String, pos:Vector2, isAvailable:bool = false,isShop:bool = false):
	find_child("PortDesc").text = portDesc
	position = pos + Vector2(0,20)
	
	$BoxContainer/Button.visible = isAvailable
	$BoxContainer/ShopButton.visible = isShop

func _on_shop_button_pressed() -> void:
	var shopGUI = preload("res://Navigation/Shop/Shop.tscn").instantiate()
	add_sibling(shopGUI)
	pass # Replace with function body.
