extends Node2D

export (int) var hidratacion

onready var reloj = $Reloj

var plantas = 0
var hid_actual
var clima_act = 1

var clima = {
	"Sequia": 1,
	"Soleado": 2,
	"Lluvia": 3
}
var plants = {
	"Semilla_ceb": preload("res://Plantas/Cebolla.tscn")
}

func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		hidratar()
	
	hid_actual = (10*clima_act)/(plantas*reloj.horas+2)^(1/2) -1/(2*clima_act)
	

func hidratar():
	reloj.ins_restart()

func _on_Area2D_body_entered(body):
	var P_seed = body.name
	var new_plant = null
	var sem_pos = body.get_position()
	
	if body.is_in_group("Semillas"):
		new_plant = plants[P_seed].instance()
		new_plant.global_position = sem_pos
		new_plant.home_position = self.global_position
		call_deferred("add_child", new_plant)
		body.inside = false
