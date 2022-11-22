extends KinematicBody2D

onready var home_position = get_global_position()
var inside = false

signal agarrando(o,v)

func _process(_delta):
	if inside == true:
		self.set_global_position(get_global_mouse_position())
		$CollisionShape2D.disabled = true
	elif inside == false:
		self.set_global_position(home_position)
		$CollisionShape2D.disabled = false

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		inside = true
		emit_signal("agarrando",0,true)
	if event.is_action_released("left_click"):
		inside = false
		emit_signal("agarrando",0,false)
