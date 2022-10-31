extends KinematicBody2D

export (String) var identificator

onready var home_position = get_global_position()
var inside = false

func _process(_delta):
	if inside == true:
		self.set_global_position(get_global_mouse_position() + Vector2(0, -5))
	elif inside == false:
		self.set_global_position(home_position)

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		inside = true
	if event.is_action_released("left_click"):
		inside = false