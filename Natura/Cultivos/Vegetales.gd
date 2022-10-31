extends KinematicBody2D

export (String) var identificator

var Can_grow = true
var current_growth = 0
var previous_growth = current_growth

onready var Hidratacion = $Hidratacion

var al_grown = false

var inside = false
var home_position

func _ready():
	$Hidratacion.connect("water_changed",self,"new_water")
	$Hidratacion.connect("watered",self,"watered")

func _process(_delta):
	if current_growth >= 8:
		al_grown = true
	if al_grown == false:
		Can_grow = $Hidratacion.hydrated
		current_growth = $Crecimiento_base.current_growth
		$Crecimiento_base.Can_grow = Can_grow
		if Can_grow == true:
			if previous_growth != current_growth:
				animation()
				previous_growth = current_growth
	else:
		$Crecimiento_base.stop()
		$Hidratacion.stop()
		move()


func move():
	if inside == true:
		$CollisionShape2D.disabled = true
		self.set_global_position(get_global_mouse_position())
	elif inside == false:
		$CollisionShape2D.disabled = false
		self.set_global_position(home_position)

func new_water():
	if Can_grow == true:
		$Crecimiento_base.Can_grow = false
		Can_grow = false
	if Can_grow == false:
		$AnimatedSprite.modulate.r += 1

func watered():
	Can_grow = true
	$AnimatedSprite.modulate.r = 1

func animation():
	if current_growth < 2:
		$AnimatedSprite.frame = 0
	elif current_growth >= 2 and current_growth < 4:
		$AnimatedSprite.frame = 1
	elif current_growth >= 4 and current_growth < 6:
		$AnimatedSprite.frame = 2
	elif current_growth >= 6 and current_growth < 8:
		$AnimatedSprite.frame = 3
	elif current_growth >= 8 and current_growth < 10:
		$AnimatedSprite.frame = 4

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		inside = true
	if event.is_action_released("left_click"):
		inside = false
