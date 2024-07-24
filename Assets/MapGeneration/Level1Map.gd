extends Node2D

var player = "Player"
var spawn = "Spawn"
var spawnPos

func _ready(): 
	spawnPos = get_node(spawn).position
	MovePlayerToSpawn()


func MovePlayerToSpawn():
	get_node(player).position = spawnPos
