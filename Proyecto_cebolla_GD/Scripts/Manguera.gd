extends KinematicBody2D

onready var home_position = get_global_position()
var inside = false
var open = false

func _process(_delta):
	
	var r = get_angle_to(get_parent().salida)
	self.rotate(r)
	
	if inside == true:
		self.set_global_position(get_global_mouse_position())
	elif inside == false:
		self.set_global_position(home_position)
	
	$CollisionShape2D.disabled = Dinero.dinero < 1

func _on_AreaClicks_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		inside = true
		$AudioStreamPlayer2D.play()
	if event.is_action_released("left_click"):
		inside = false
		$AudioStreamPlayer2D.stop()
