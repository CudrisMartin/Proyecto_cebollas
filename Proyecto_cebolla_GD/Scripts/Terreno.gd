extends Area2D

export (int) var hidratacion

onready var reloj = $Reloj

var plantas = []
var tasa_deshid = 1
var cl_act

var clima = {
	"Sequia": 1,
	"Soleado": 2,
	"Lluvia": 3
}

func _process(delta):
	pass
	

