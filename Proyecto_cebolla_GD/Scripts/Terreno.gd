extends Node2D

export (int) var hidratacion

onready var reloj = $Reloj

var pl = 1 
var hid_actual
var cl = 1

var cercanas = []

var full = false

var agarrando_obj = false
var obj_agarrado

var plantas = {
	"Semilla_ceb": preload("res://Plantas/Cul_cebolla.tscn")
}

func _process(_delta):
	
	pl = 1
	
	for i in cercanas:
		if i.full == true:
			pl += 1
	
	cl = get_parent().clima_act
	hid_actual = float(1/(float(pl*(float(sqrt(((float(pow((float((pl/cl)*reloj.horas)),4)))+1))))/cl)) +1)
	var col_actual = (2 - hid_actual)/2 *100
	
	$ColorRect.color.a8 = col_actual
	
	resaltar()

func hidratar():
	reloj.restart()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Semillas"):
		var P_seed = body.name
		var new_plant = null
		if full == false and Dinero.dinero >= 10:
			if plantas.has(P_seed):
				full = true
				new_plant = plantas[P_seed].instance()
				new_plant.global_position = self.position
				new_plant.ter = self
				get_parent().call_deferred("add_child", new_plant)
				body.inside = false
				Dinero.cobrar_semillas()
	elif body.get_name() == "Manguera":
		hidratar()
		Dinero.cobrar_agua()

func _on_Plantas_cer_area_entered(area):
	if area.get_parent().is_in_group("Terreno"):
		cercanas.append(area.get_parent())

func cosechar():
	full = false

func reiniciar():
	reloj.restart()

func agarrando(objeto, valor):
	agarrando_obj = valor
	obj_agarrado = objeto
	

func resaltar():
	if agarrando_obj == true:
		match obj_agarrado:
			0:
				if full == false:
					$AnimationPlayer.play("Resaltar")
	else:
		if $AnimationPlayer.is_playing() == true:
			$AnimationPlayer.stop()
		$Marco.self_modulate = Color(0,0,0,0)
