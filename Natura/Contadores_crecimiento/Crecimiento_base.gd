extends Node

var Can_grow = true
var P_C_grow = Can_grow
var current_growth = 0

var can_count = true

func _ready():
	$Timer.start()
func _process(_delta):
	if P_C_grow != Can_grow:
		Timer_control(Can_grow)
		P_C_grow = Can_grow

func stop():
	can_count = false

func Timer_control(verificator:bool):
	if verificator == true:
		$Timer.start()
	else:
		$Timer.stop()

func _on_Timer_timeout():
	if can_count == true:
		if Can_grow == true:
			current_growth += 1
		$Timer.start()
