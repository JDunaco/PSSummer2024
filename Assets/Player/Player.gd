extends CharacterBody2D
#flash light array for NEWS
@onready var flashlight = [get_node("FlashLightRight"),get_node("FlashLightUP"),get_node("FlashLightL"),get_node("FlashLightDown")]
#Speed Var
@export var speed = 100
@onready var anim = get_node("AnimatedSprite2D")
@export var Spell : PackedScene
signal player_Fired_Spell(spell, position, direction)
var spellTimer = 0.0

func _ready():
	anim.play("Idle")
#Input function
func get_input():
	#input for movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction:
		if input_direction.x > 0 :
			get_node("AnimatedSprite2D").flip_h = false
		elif input_direction.x < 0:
			get_node("AnimatedSprite2D").flip_h = true
		velocity = input_direction * speed
		anim.play("Smoving")
	else:
		anim.play("Idle")
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

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot") :
		if (spellTimer <=0):
			shoot()
			spellTimer = 0

func shoot():
	var spell_instance = Spell.instantiate()
	var target = get_global_mouse_position()
	var direction_to_mouse = self.global_position.direction_to(target).normalized()
	emit_signal("player_Fired_Spell", spell_instance, target, direction_to_mouse)



func _physics_process(delta):
	get_input()
	spellTimer -= (1 * delta)
	move_and_slide()
