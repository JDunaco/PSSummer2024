extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		Game.items[0] += 1
		print("collected Item1")
		queue_free()
