extends Node

var current_water = 10
var previous_water = current_water
var hydrated = true

var T_started = false

var can_count = true

signal water_changed()
signal watered()

func _process(_delta):
	if T_started == false:
		$Timer.start()
		T_started = true
	
	if current_water <= 0:
		get_parent().queue_free()
	
	if previous_water != current_water and current_water != 10:
		emit_signal("water_changed")
		previous_water = current_water
		$AudioStreamPlayer.play()
		$AudioStreamPlayer.pitch_scale += 0.5
	elif previous_water!= current_water and current_water == 10:
		emit_signal("watered")
		$AudioStreamPlayer.pitch_scale = 1

func stop():
	can_count = false

func watered():
	emit_signal("watered")
	hydrated = true
	$Drying_timer.stop()
	$Timer.start()
	T_started = true
	current_water = 10

func _on_Timer_timeout():
	T_started = false
	$Drying_timer.start()
	hydrated = false

func _on_Drying_timer_timeout():
	if can_count == true:
		current_water -= 1
		$Drying_timer.start()
