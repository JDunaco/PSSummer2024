extends Node2D


func _on_start_button_up():
	get_tree().change_scene_to_file("res://Scenes/FirstFloor.tscn")


func _on_how_to_button_up():
	get_tree().change_scene_to_file("res://Scenes/how_to.tscn")


func _on_leave_button_up():
	get_tree().quit()
