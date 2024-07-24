#Random Number Generator
extends Node2D
var rng = RandomNumberGenerator.new()

var numofSelection = [1,1,1,1,1,1,1,1]
var numChosen = [0,0,0,0]
var randTileNum
var testResult = 0
var initialPosition = Vector2(-300,-300)
var tiles = ["RoomType1","RoomType2","RoomType3","RoomType4","RoomType5","RoomType6","RoomType7","RoomType8"]
var tileNumToSpawn = 0

func _ready():
	_moveRoomsToStart()
	_randSelect()

func _moveRoomsToStart():
	get_node(tiles[0]).position = initialPosition
	get_node(tiles[1]).position = initialPosition
	get_node(tiles[2]).position = initialPosition
	get_node(tiles[3]).position = initialPosition
	get_node(tiles[4]).position = initialPosition
	get_node(tiles[5]).position = initialPosition
	get_node(tiles[6]).position = initialPosition
	get_node(tiles[7]).position = initialPosition

func _moveRandTile(spotToMove, tileToMove):
	if spotToMove == 0:
		get_node(tiles[tileToMove]).position = Vector2(200,462)
	elif spotToMove == 1:
		get_node(tiles[tileToMove]).position = Vector2(488,462)
	elif spotToMove == 2:
		get_node(tiles[tileToMove]).position = Vector2(200,238)
	elif spotToMove == 3:
		get_node(tiles[tileToMove]).position = Vector2(488,238)

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

