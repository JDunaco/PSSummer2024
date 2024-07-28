extends Node2D

var craftSlot1 = false
var craftSlot2 = false
var ingredientItem = ["Dragable Item 1","Dragable Item 2","Dragable Item 3"]

func _process(delta):
	$"Dragable Item 1/Label".text = "Item1 : " + str(Game.items[0])
	$"Dragable Item 2/Label".text = "Item2 : " + str(Game.items[1])
	$"Dragable Item 3/Label".text = "Item3 : " + str(Game.items[2])

func _checkIfSlotFull():
	if get_node(ingredientItem[0]).craftingSlot1 == true:
		print('item1 in slot 1')
		craftSlot1 = true
	elif get_node(ingredientItem[0]).craftingSlot2 == true:
		print('item1 in slot2')
		craftSlot2 = true
	if get_node(ingredientItem[1]).craftingSlot1 == true:
		print('item2 in slot 1')
		craftSlot1 = true
	elif get_node(ingredientItem[1]).craftingSlot2 == true:
		print('item2 in slot2')
		craftSlot2 = true
	if get_node(ingredientItem[2]).craftingSlot1 == true:
		print('item3 in slot 1')
		craftSlot1 = true
	elif get_node(ingredientItem[2]).craftingSlot2 == true:
		print('item3 in slot2')
		craftSlot2 = true
	if (craftSlot1 == false or craftSlot2 == false):
		print ("not enough ingredients, try again")


func _on_button_button_up():
	_checkIfSlotFull()
