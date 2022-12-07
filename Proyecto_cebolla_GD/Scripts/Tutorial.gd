extends Node2D

var dialogos = {
	0: "Bienvenido a Agronomia",
	1: "Para plantar una semilla, arrastrala a una\ncasilla de tierra",
	2: "La planta crecera mas rapido mientras mas\nhidratada este la tierra",
	3: "Puedes arrastrar la manguera\npara hidratar el terreno",
	4: "El clima afecta que tan hidratada esta la\ntierra, si hay sequia crecera muy lento",
	5: "Y si llueve demasiado se pueden pudrir",
	6: "Una vez veas el fruto, arrancala con el click",
	7: "Para vender el cultivo, arrastralo al auto",
	8: "Sobrevivir cada dia cuesta 100 de dinero,\nasegurate de planear tus movimientos",
	9: "Listo, ya tienes todo para empezar a jugar"
}

var climas = {
	1: Color(0.98,
			0.98,
			0.40,
			0.15),
	2: Color(0,
			0,
			0,
			0),
	3: Color(0.16,
			0.15,
			0.15,
			0.19)
}

var SFX_climas = {
	1: preload("res://SFX/Sequia.ogg"),
	3: preload("res://SFX/Lluvia.ogg")
}

var clima_act = 2

var d_act = 0

var terrenos = []

var t_acabado

func _ready():
	$Manguera.hide()
	$Semilla_ceb.hide()
	$Carro.hide()
	$Lluvia.emitting = false
	
	terrenos = get_tree().get_nodes_in_group("Terreno")
	for i in terrenos:
# warning-ignore:return_value_discarded
		$Semilla_ceb.connect("agarrando",i,"agarrando")
	

func _process(delta):
	$Tutorial/Label.text = dialogos[d_act]
	
	match d_act:
		1:
			$Semilla_ceb.show()
			for i in terrenos:
				if i.full:
					$Tutorial/Continuar.show()
		2:
			$Tutorial/Continuar.show()
		3:
			$Manguera.show()
			if $Manguera/Manguera.inside:
				$Tutorial/Continuar.show()
			$Clima1.play()
		4:
			clima_act = 1
			$CanvasLayer/Clima_act.color = climas[1]
			$Tutorial/Continuar.show()
			$Clima2.play()
		5:
			$Clima1.stop()
			clima_act = 3
			$CanvasLayer/Clima_act.color = climas[3]
			$Lluvia.emitting = true
			$Tutorial/Continuar.show()
			
		6:
			var resul = 0
			for i in terrenos:
				if i.full:
					resul += 1
			if resul == 0:
				$Tutorial/Continuar.show()
		7: 
			$Carro.show()
			if t_acabado:
				$Tutorial/Continuar.show()
		8: 
			$Tutorial/Continuar.show()
		9:
			$Tutorial/Continuar.text = "A jugar"
			$Tutorial/Continuar.show()


func _on_Continuar_pressed():
	if d_act < 8:
		d_act += 1
		$Tutorial/Continuar.hide()
	else:
		SceneManager.change_to_game()
	$Boton_sfx.play()
	

func _on_Carro_body_entered(body):
	t_acabado = true
