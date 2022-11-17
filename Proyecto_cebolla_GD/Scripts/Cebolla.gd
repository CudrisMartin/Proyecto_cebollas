extends RigidBody2D

var inside = false

var calidad = 0

var precio = 0

func _ready():
	if calidad < 7:
		precio = 12 + calidad
	else:
		precio = 12 - calidad/2

func _process(_delta):
	sleeping = inside
	if inside:
		global_position = get_global_mouse_position()

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	
	if event.is_action_pressed("left_click"):
		inside = true
	if event.is_action_released("left_click"):
		inside = false

func delete():
	self.queue_free()
