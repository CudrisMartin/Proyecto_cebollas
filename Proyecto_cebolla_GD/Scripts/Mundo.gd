extends Node2D

var clima_act = 2

var climas = {
	1: Color(1,
			0.79,
			0,
			0.35),
	2: Color(0,
			0,
			0,
			0),
	3: Color(0.16,
			0.15,
			0.15,
			0.19)
}

func _ready():
	$Clima.connect("clima_nuevo",self,"clima_nuevo")

func _process(delta):
	$Label.text = "Dinero: " + str(Dinero.dinero) +"\nClima actual: "+str(clima_act)
	$Lluvia.emitting = (clima_act == 3)

func clima_nuevo(cl):
	clima_act = cl
	$ColorRect.color = climas[cl]

