extends CharacterBody2D

var player
var speed = 25
var patrol = false
var chase = false
var timerToStartPatrol = 2.0
var patrolTimer = 4.0
var rPatrol = false

func _ready():
	get_node("AnimatedSprite2D").play("default")

func _physics_process(_delta):
	velocity = Vector2.ZERO
	if player:
		chase = true
		patrol = false
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			# get_node("AnimatedSprite2D").flip_h = true
			velocity = direction * speed
		else : 
			# get_node("AnimatedSprite2D").flip_h = false
			velocity = direction * speed
	else:
		pass
	move_and_slide()

func _process(delta):
	if player:
		speed = 50
		chase = true
		patrol = false
	else:
		speed = 25
		chase = false
	if chase == false and patrol == true:
		timerToStartPatrol = 3.0
		if rPatrol == false:
			if patrolTimer >= 0.0:
				self.position.y += speed * delta
				patrolTimer = patrolTimer - (1 * delta)
			else:
				rPatrol = true
				patrolTimer = 4.0
		elif rPatrol == true:
			if patrolTimer >= 0.0:
				self.position.y -= speed * delta
				patrolTimer = patrolTimer - (1 * delta)
			else:
				rPatrol = false
				patrolTimer = 4.0
	elif chase == false and patrol == false:
		if timerToStartPatrol >= 0.0:
			timerToStartPatrol = timerToStartPatrol - (1 * delta)
		elif timerToStartPatrol < 0:
			patrol = true

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		player = body
	


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		player = null


func _on_player_death_body_entered(body):
	if body.name == "Player":
		Game.spotted = true


func _on_spell_detection_body_entered(body):
	player = body



func _on_spell_detection_body_exited(_body):
	player = null
