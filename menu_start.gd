extends Control

func _on_button_start_pressed():
	get_tree().change_scene_to_file("res://2dMoveTest.tscn")

func _on_button_settings_pressed():
	get_tree().change_scene_to_file("res://settingsScreen.tscn")

func _on_button_quit_pressed():
	get_tree().quit()
