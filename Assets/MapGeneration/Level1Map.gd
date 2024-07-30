extends Node2D

var player = "Player"
var spawn = "Spawn"
var spawnPos
@onready var inventory = get_node("UI/Inventory")
@onready var craftingMenu = get_node("UI/CraftingTerminal")
var craftShown = false

func _ready(): 
	spawnPos = get_node(spawn).position
	MovePlayerToSpawn()
	inventory.hide()

func _process(_delta):
	
	if Input.is_action_just_pressed("c"):
		if craftShown == false:
			craftingMenu.show()
			craftShown = true
		else:
			craftingMenu.hide()
			craftShown = false
	if Input.is_action_just_pressed("tab"):
		inventory.show()
	if Input.is_action_just_released("tab"):
		inventory.hide()



func MovePlayerToSpawn():
	get_node(player).position = spawnPos

