#Random Number Generator
extends Node2D
#RNG variable
var rng = RandomNumberGenerator.new()
#preload enemy scenes
const enemy_base = preload("res://Assets/Mobs/EnemyCopy.tscn")
const itemSpawns = [preload("res://Assets/Items/item_1.tscn"),preload("res://Assets/Items/item_2.tscn"),preload("res://Assets/Items/item_3.tscn")]
#array to hold how many times a room can spawn
var numofSelection = [1,1,1,1,1,1,1,1]
#array for random rooms generated
var numChosen = [0,0,0,0]
var randTileNum
var testResult = 0
# set the rooms off screen when not in use
var initialPosition = Vector2(-300,-300)
#array to hold the room type scenes
var tiles = ["RoomType1","RoomType2","RoomType3","RoomType4","RoomType5","RoomType6","RoomType7","RoomType8"]
# var to check if they have any more room spawns
var tileNumToSpawn = 0

var RoomSpawn1 = Vector2(1842,0)
var RoomSpawn2 = Vector2(1842,350)
var RoomSpawn3 = Vector2(1842,700)
var RoomSpawn4 = Vector2(1842,1050)






#NOTE will need to swap over to multilevel room type idea
func _ready():
	_moveRoomsToStart()
	_randSelect()
#position all rooms offscreen
func _moveRoomsToStart():
	get_node(tiles[0]).position = initialPosition
	get_node(tiles[1]).position = initialPosition
	get_node(tiles[2]).position = initialPosition
	get_node(tiles[3]).position = initialPosition
	get_node(tiles[4]).position = initialPosition
	get_node(tiles[5]).position = initialPosition
	get_node(tiles[6]).position = initialPosition
	get_node(tiles[7]).position = initialPosition
	
#move selected tile to position
func _moveRandTile(spotToMove, tileToMove):
	if spotToMove == 0:
		get_node(tiles[tileToMove]).position = RoomSpawn1
		spawn(RoomSpawn1)
	elif spotToMove == 1:
		get_node(tiles[tileToMove]).position = RoomSpawn2
		spawn(RoomSpawn2)
	elif spotToMove == 2:
		get_node(tiles[tileToMove]).position = RoomSpawn3
		spawn(RoomSpawn3)
	elif spotToMove == 3:
		get_node(tiles[tileToMove]).position = RoomSpawn4
		spawn(RoomSpawn4)

#randomly select room
func _randSelect():
	for x in numChosen:
		while testResult == 0:
			numChosen[x] = rng.randi_range(0,7)
			if numofSelection[numChosen[x]] <= 0:
				print("out of tiles")
			else:
				numofSelection[numChosen[x]] -= 1
				_moveRandTile(tileNumToSpawn, numChosen[x])
				tileNumToSpawn += 1
				testResult = 1
		print(numChosen[x])
		testResult = 0
#spawn function for enemies randomly in room.
func spawn(pos):
	var enemyInstance = enemy_base.instantiate()
	var randItemNum = randi_range(0,2)
	var itemInstance = itemSpawns[randItemNum].instantiate()
	var itemSpawnPos = Vector2(0,0)
	var maxRangeSpawn = Vector2(0,0)
	maxRangeSpawn = pos
	itemSpawnPos.x = randf_range(pos.x + 20, pos.x + 140)
	pos.x = randf_range(pos.x+20, pos.x+300)
	itemSpawnPos.y = randf_range(pos.y + 20, pos.y + 140)
	pos.y = randf_range(pos.y+20, pos.y+150)
	if itemSpawnPos.x >= pos.x - 20 and itemSpawnPos.x <= pos.x + 20 :
		if(itemSpawnPos.x >= maxRangeSpawn.x - 20):
			itemSpawnPos.x -= 20
		else:
			itemSpawnPos.x += 20
	if itemSpawnPos.y >= pos.x - 20 and itemSpawnPos.y <= pos.x + 20 :
		if(itemSpawnPos.y >= maxRangeSpawn.y - 20):
			itemSpawnPos.y -= 20
		else:
			itemSpawnPos.y += 20
	enemyInstance.position = pos
	itemInstance.position = itemSpawnPos
	add_child(itemInstance)
	add_child(enemyInstance)

