extends CharacterBody2D

@onready var player = get_node("../Player")
var speed = 50
var flashlight
@export var centerPosX = 0.0
@export var centerPosY = 0.0
var posCenter = Vector2(0,0)
var waypoint = [Vector2(370,650),Vector2(720,650),Vector2(720,-20),Vector2(370,-20)]
var waypointTracker = 3
var spawnstop = 3.0
var playerInLight
@onready var playercheckRaycast = get_node("BossLight/Area2D/CollisionPolygon2D/PlayerCheck")

#func _physics_process(delta):
	#player = get_node("../Player")

func _ready():
	get_node("AnimatedSprite2D").play("default")
	posCenter.x = centerPosX
	posCenter.y = centerPosY
	flashlight = get_node("BossLight")
	print(flashlight.position)


func _process(delta):
	if playerInLight == true:
		if playercheckRaycast.get_collider() == player:
			Game.spotted = true

func _physics_process(delta):
	#playercheckRaycast.set_target_position(player.position)
	flashlight.look_at(posCenter)
	bossMovementAroundRoom(delta)
	move_and_slide()

func bossMovementAroundRoom(delta):
	if spawnstop < 0.0:
		if waypointTracker == 0:
			if self.position.y >= waypoint[0].y :
				self.position = waypoint[0]
				waypointTracker = 1
			else:
				self.position.y += speed * delta
		elif waypointTracker == 1:
			if self.position.x >= waypoint[1].x :
				self.position = waypoint[1]
				waypointTracker = 2
			else :
				self.position.x += speed * delta
		elif waypointTracker == 2:
			if self.position.y <= waypoint[2].y :
				self.position = waypoint[2]
				waypointTracker = 3 
			else :
				self.position.y -= speed * delta
		elif waypointTracker == 3:
			if self.position.x <= waypoint[3].x :
				self.position = waypoint[3]
				waypointTracker = 0
			else:
				self.position.x -= speed * delta
	else :
		spawnstop -= (1 * delta)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		playerInLight = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		playerInLight = false
