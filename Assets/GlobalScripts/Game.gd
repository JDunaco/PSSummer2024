extends Node

var items = [0,0,0,0,0,0,0,0]
var crafting = false
var spotted = false
var doorLocked = true

func _process(delta):
	if spotted == true:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
		spotted = false
