extends StaticBody2D

var aliveTimer = 5.0

func _process(delta):
	if aliveTimer <= 0:
		self.queue_free()
	else:
		aliveTimer -= (1*delta)




