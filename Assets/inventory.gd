extends Node2D


func _process(_delta):
	$GridContainer/Area1/Label.text = "Pencil : " + str(Game.items[0])
	$GridContainer/Area2/Label.text = "Powder : " + str(Game.items[1])
	$GridContainer/Area3/Label.text = "Water : " + str(Game.items[2])
	$GridContainer/Area4/Label.text = "Item4 : " + str(Game.items[3])
	$GridContainer/Area5/Label.text = "Item5 : " + str(Game.items[4])
	$GridContainer/Area6/Label.text = "Item6 : " + str(Game.items[5])
	$GridContainer/Area7/Label.text = "Item7 : " + str(Game.items[6])
	$GridContainer/Area8/Label.text = "Item8 : " + str(Game.items[7])
