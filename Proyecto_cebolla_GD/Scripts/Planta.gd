extends KinematicBody2D

export (int) var vel_cre
export (int) var fert
export (int) var hid

var home_position

onready var m = float(fert)/float(vel_cre)
onready var ter

onready var re = $Reloj

var crecimiento = 0

func _process(delta):
	
	hid = ter.hid_actual
	
	var cre = m*re.horas
	
	crecimiento = cre + hid
	
	$Label.text = "Cre: "+ str(cre)+" Crecimiento: "+str(crecimiento)+"\nHora: "+str(re.horas)+" Minuto: "+str(re.minutos)
	
	$AnimatedSprite.frame = int(crecimiento)
	
	
