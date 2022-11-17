extends Node2D

var clima_act = 2

func _ready():
	$Clima.connect("clima_nuevo",self,"clima_nuevo")

func _process(delta):
	$Label.text = "Dinero: " + str(Dinero.dinero) +"Clima actual: "+str(clima_act)

func clima_nuevo(cl):
	clima_act = cl
