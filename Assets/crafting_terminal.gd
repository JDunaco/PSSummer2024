extends Node2D

var craftSlot1 = false
var craftSlot2 = false
var ingredientItem = ["Dragable Item 1","Dragable Item 2","Dragable Item 3"]
var DoorLabel
var NEILabel

func _ready():
	DoorLabel = get_node("DoorUnlocked")
	NEILabel = get_node("NEI")

func _process(delta):
	$"Dragable Item 1/Label".text = "Item1 : " + str(Game.items[0])
	$"Dragable Item 2/Label".text = "Item2 : " + str(Game.items[1])
	$"Dragable Item 3/Label".text = "Item3 : " + str(Game.items[2])

func _checkIfSlotFull():
	if get_node(ingredientItem[0]).craftingSlot1 == true:
		if (Game.items[0] > 0):
			Game.items[0] -= 1
			craftSlot1 = true
	elif get_node(ingredientItem[0]).craftingSlot2 == true:
		if (Game.items[0] > 0):
			Game.items[0] -= 1
			craftSlot2 = true
	if get_node(ingredientItem[1]).craftingSlot1 == true:
		if (Game.items[1] > 0):
			Game.items[1] -= 1
			craftSlot1 = true
	elif get_node(ingredientItem[1]).craftingSlot2 == true:
		if (Game.items[1] > 0):
			Game.items[1] -= 1
			craftSlot2 = true
	if get_node(ingredientItem[2]).craftingSlot1 == true:
		if (Game.items[2] > 0):
			Game.items[2] -= 1
			craftSlot1 = true
	elif get_node(ingredientItem[2]).craftingSlot2 == true:
		if (Game.items[2] > 0):
			Game.items[2] -= 1
			craftSlot2 = true
	if (craftSlot1 == false or craftSlot2 == false):
		NEILabel.show()
	else :
		return true


func _on_button_button_up():
	if _checkIfSlotFull() == true:
		DoorLabel.show()
		Game.doorLocked = false
