extends Area2D

onready var home_position = get_global_position()
var inside = false


func _process(_delta):
	if inside == true:
		$CollisionShape2D.disabled = false
		self.set_global_position(get_global_mouse_position())
	elif inside == false:
		$CollisionShape2D.disabled = true
		self.set_global_position(home_position)
		


func _on_Area2D_body_entered(body):
	if body.is_in_group("Plant"):
		body.queue_free()
		inside = false

func _on_Grab_Area_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		
		inside = true
	if event.is_action_released("left_click"):
		
		inside = false

