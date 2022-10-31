extends KinematicBody2D

export (int) var vel_cre
export (int) var fert
export (int) var hid

onready var re = $Reloj

var crecimiento = 0

func _process(delta):
	
	var cre = (fert/vel_cre)*re.horas
	
	crecimiento = int(cre + (1/hid))
	
	$Label.text = "Crecimiento: "+str(crecimiento)
	
	$AnimatedSprite.frame = crecimiento
	
	
