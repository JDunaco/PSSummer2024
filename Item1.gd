extends Area2D

@export var itemNum = 0


func _on_body_entered(body):
	if body.name == "Player":
		Game.items[itemNum] += 1
		print("collected Item" + str(itemNum + 1))
		queue_free()
