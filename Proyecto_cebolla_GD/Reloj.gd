extends Node

var segundos = 0
var minutos = 0
var horas = 0

func _process(delta):
	segundos += 1
	if segundos == 60:
		minutos += 1
		segundos = 0
	if minutos == 60:
		horas += 1
		minutos = 0
	if horas == 12:
		self.queue_free()
	print("Horas: "+str(horas)+" Minutos: "+str(minutos)+" Segundos: "+str(segundos))
