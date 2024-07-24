extends CharacterBody2D
#flash light array for NEWS
@onready var flashlight = [get_node("FlashLightRight"),get_node("FlashLightUP"),get_node("FlashLightL"),get_node("FlashLightDown")]
#Speed Var
@export var speed = 100

func _ready():
	pass
#Input function
func get_input():
	#input for movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	#input for flashlight to follow character
	if Input.is_action_pressed("left"):
		flashlight[0].hide()
		flashlight[1].hide()
		flashlight[2].show()
		flashlight[3].hide()
	if Input.is_action_pressed("right"):
		flashlight[0].show()
		flashlight[1].hide()
		flashlight[2].hide()
		flashlight[3].hide()
	if Input.is_action_pressed("up"):
		flashlight[0].hide()
		flashlight[1].show()
		flashlight[2].hide()
		flashlight[3].hide()
	if Input.is_action_pressed("down"):
		flashlight[0].hide()
		flashlight[1].hide()
		flashlight[2].hide()
		flashlight[3].show()


func _physics_process(_delta):
	get_input()
	move_and_slide()
