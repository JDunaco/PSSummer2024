extends Sprite2D

var is_draggable = false #state Management
var mouse_offset #center mouse
var delay = 10
var positionInitial = Vector2(400,120)
var craftingSlot1 = false
var craftingSlot2 = false
func _ready():
	self.position = positionInitial

func _physics_process(delta):
	if is_draggable == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position(), delay * delta)
	else :
		_checkRange1()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print("clicked")
				is_draggable = true
		else : 
			is_draggable = false

func _checkRange1():
	if(self.position.x > 150 && self.position.x < 150+128) :
		if(self.position.y > 450 && self.position.y < 450+128) :
			is_draggable = false
			self.position = Vector2(220,520)
			craftingSlot1 = true
			craftingSlot2 = false
	else:
		_checkRange2()

func _checkRange2():
	if(self.position.x > 500 && self.position.x < 500+128) :
		if(self.position.y > 450 && self.position.y < 450+128) :
			is_draggable = false
			self.position = Vector2(570,520)
			craftingSlot2 = true
			craftingSlot1 = false
	else:
		is_draggable = false
		self.position = positionInitial
		craftingSlot1 = false
		craftingSlot2 = false
