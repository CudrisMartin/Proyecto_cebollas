extends KinematicBody2D

export (int) var vel_cre
export (int) var fert
export (int) var hid

onready var m = float(fert)/float(vel_cre)

onready var re = $Reloj

var crecimiento = 0

func _process(delta):
	
	var cre = m*re.horas
	
	crecimiento = (cre + (1/hid))
	
	$Label.text = "Cre: "+ str(cre)+" Crecimiento: "+str(crecimiento)+"\nHora: "+str(re.horas)+" Minuto: "+str(re.minutos)
	
	$AnimatedSprite.frame = int(crecimiento)
	
	
