#Random Number Generator
extends Node2D
#RNG variable
var rng = RandomNumberGenerator.new()
#preload enemy scenes
const enemy_base = preload("res://Assets/Mobs/EnemyCopy.tscn")
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
		get_node(tiles[tileToMove]).position = Vector2(200,462)
		spawn(Vector2(200,462))
	elif spotToMove == 1:
		get_node(tiles[tileToMove]).position = Vector2(488,462)
		spawn(Vector2(488,462))
	elif spotToMove == 2:
		get_node(tiles[tileToMove]).position = Vector2(200,238)
		spawn(Vector2(200,238))
	elif spotToMove == 3:
		get_node(tiles[tileToMove]).position = Vector2(488,238)
		spawn(Vector2(488,238))

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
	pos.x = randf_range(pos.x+20, pos.x+140)
	print(pos.x)
	pos.y = randf_range(pos.y+20, pos.y+108)
	print(pos.y)
	enemyInstance.position = pos
	add_child(enemyInstance)

