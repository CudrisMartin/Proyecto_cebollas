extends Node2D

export (int) var hidratacion

onready var reloj = $Reloj

var pl = 1 
var hid_actual
var cl = 1

var cercanas = []

var full = false

var climas = {
	"Sequia": 1,
	"Soleado": 2,
	"Lluvia": 3
}
var plantas = {
	"Semilla_ceb": preload("res://Plantas/Cul_cebolla.tscn")
}

func _process(delta):
	
	pl = 1
	
	for i in cercanas:
		if i.full == true:
			pl += 1
	
	if Input.is_action_just_pressed("ui_accept"):
		hidratar()
	
	var a = float((pl/cl)*reloj.horas)
	var b = float(pow(a,4))
	var c = float(sqrt((b+1)))
	var d = float(pl*c/cl)
	hid_actual = float(1/d +1)
	
	$Label.text = "Hidratacion actual: "+str(hid_actual)+"\nHoras: "+str(reloj.horas)+" Minutos: "+str(reloj.minutos)

func hidratar():
	reloj.ins_restart()

func _on_Area2D_body_entered(body):
	var P_seed = body.name
	var new_plant = null
	if body.is_in_group("Semillas"):
		if full == false:
			if plantas.has(P_seed):
				full = true
				new_plant = plantas[P_seed].instance()
				new_plant.global_position = self.position #- Vector2(0, 10)
				new_plant.ter = self
				get_parent().call_deferred("add_child", new_plant)
				new_plant.home_position = self.global_position #+Vector2(0,-10)
				body.inside = false
				


func _on_Plantas_cer_area_entered(area):
	if area.get_parent().is_in_group("Terreno"):
		cercanas.append(area.get_parent())
