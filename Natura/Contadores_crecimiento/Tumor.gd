extends Node

var salud = 20
var salud_previa = salud
var salud_pares = [18,16,12,8,4]

func _process(_delta):
	if salud_previa != salud:
		clamp(salud,0,20)
		match salud:
			18:
				$Decreases.play()
			16:
				$Decreases.play()
			12:
				$Decreases.play()
			8:
				$Decreases.play()
			4:
				$Decreases.play()
			_:
				pass
		salud_previa = salud

func _on_Timer_timeout():
	salud -= 1
	$Timer.start()

