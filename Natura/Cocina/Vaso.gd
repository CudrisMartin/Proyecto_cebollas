extends Area2D

signal healing()

func _ready():
	$AnimatedSprite.frame = 0

func prepared():
	$AnimatedSprite.frame = 1
	print("prepared")

func _on_Vaso_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		$AudioStreamPlayer.play()
		$AnimatedSprite.frame = 0
		emit_signal("healing")
