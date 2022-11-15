extends Node

signal fin_reloj()

export (int) var horas_max = 0
export (int) var modo = 0

var segundos = 0
var minutos = 0
var horas = 0
var activado = true

func reset():
	segundos = 0
	minutos = 0
	horas = 0

func restart():
	reset()
	start()

func start():
	activado = true

func _process(_delta):
	match modo:
		0:
			re_mundial()
		1:
			re_planta()
	

func re_mundial():
	
	if activado:
		segundos += 1
		if segundos == 30:
			minutos += 1
			segundos = 0
		if minutos == 30:
			horas += 1
			minutos = 0
		if horas == horas_max:
			activado == false
			emit_signal("fin_reloj")
		#print("Mundo Horas: "+str(horas)+" Minutos: "+str(minutos))

func re_planta():
	if activado:
		segundos += 1
		if segundos == 20:
			minutos += 1
			segundos = 0
		if minutos == 30:
			horas += 1
			minutos = 0
		if horas == horas_max:
			activado == false
			emit_signal("fin_reloj")
		#print("Planta Horas: "+str(horas)+" Minutos: "+str(minutos))
