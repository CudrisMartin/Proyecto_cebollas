extends Node2D

export (int) var hidratacion

onready var reloj = $Reloj

var plantas = 1
var hid_actual
var clima_act = 1

var cercanas = []

var full = false

var clima = {
	"Sequia": 1,
	"Soleado": 2,
	"Lluvia": 3
}
var plants = {
	"Semilla_ceb": preload("res://Plantas/Cebolla.tscn")
}

func _process(delta):
	
	plantas = 1
	
	for i in cercanas:
		if i.full == true:
			plantas += 1
	
	if Input.is_action_just_pressed("ui_accept"):
		hidratar()
	
	hid_actual = (10*clima_act)/((plantas*(reloj.horas^2))+2)^(1/2) -1/(2*clima_act)
	
	$Label.text = "Hidratacion actual: "+str(hid_actual)+"\nHoras: "+str(reloj.horas)+" Minutos: "+str(reloj.minutos)

func hidratar():
	reloj.ins_restart()

func _on_Area2D_body_entered(body):
	var P_seed = body.name
	var new_plant = null
	if body.is_in_group("Semillas"):
		if full == false:
			if plants.has(P_seed):
				full = true
				new_plant = plants[P_seed].instance()
				new_plant.global_position = self.position #- Vector2(0, 10)
				new_plant.ter = self
				get_parent().call_deferred("add_child", new_plant)
				new_plant.home_position = self.global_position #+Vector2(0,-10)
				body.inside = false
				


func _on_Plantas_cer_area_entered(area):
	if area.get_parent().is_in_group("Terreno"):
		cercanas.append(area.get_parent())
