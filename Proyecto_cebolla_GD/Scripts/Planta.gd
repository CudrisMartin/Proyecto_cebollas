extends KinematicBody2D

export (int) var vel_cre
export (int) var fert
export (int) var hid

var home_position

onready var m = float(fert)/float(vel_cre)
onready var ter

onready var re = $Reloj

var crecimiento = 0

var generar = false

const F_CEBOLLA = preload("res://Plantas/Cebolla.tscn")

func _process(delta):
	
	hid = ter.hid_actual
	
	var cre = m*re.horas
	
	crecimiento = cre + hid
	
	$Label.text = "Cre: "+ str(cre)+" Crecimiento: "+str(crecimiento)+"\nHora: "+str(re.horas)+" Minuto: "+str(re.minutos)
	
	$AnimatedSprite.frame = int(crecimiento)
	
	if generar == true:
		if crecimiento >= 4:
			var f = F_CEBOLLA.instance()
			f.calidad = crecimiento
			get_parent().add_child(f)
			self.queue_free()

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_released("left_click"):
		generar = true
