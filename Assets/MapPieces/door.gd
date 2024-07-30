extends Area2D

@export var door_Num = 1
var player
var roomPos1
var roomPos101
var roomPos2
var roomPos202
var roomPos3 
var roomPos303
var roomPos4
var roomPos404
var teleport = false

func _ready():
	roomPos1 =Vector2(2080, 205)
	roomPos101 =Vector2(592,622)
	roomPos2 =Vector2(2080, 455)
	roomPos202 =Vector2(272,400)
	roomPos3 =Vector2(2080, 705)
	roomPos303 =Vector2(592,400)
	roomPos4 =Vector2(2080, 955)
	roomPos404 =Vector2(272,622)

func _on_body_entered(body):
	if body.name == "Player":
		player = body
		if door_Num == 1 :
			player.position = roomPos1
		elif door_Num == 101:
			player.position = roomPos101
		elif door_Num == 2 :
			player.position = roomPos2
		elif door_Num == 202:
			player.position = roomPos202
		elif door_Num == 3 :
			player.position = roomPos3
		elif door_Num == 303:
			player.position = roomPos303
		elif door_Num == 4 :
			player.position = roomPos4
		elif door_Num == 404:
			player.position = roomPos404
		elif door_Num == 100:
			if Game.doorLocked == false:
				get_tree().change_scene_to_file("res://Scenes/BossFloor1.tscn")
		elif door_Num == 200:
			get_tree().change_scene_to_file("res://Scenes/Victory.tscn")
		else : 
			print("door invalid")


