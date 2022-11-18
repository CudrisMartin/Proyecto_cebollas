extends Node2D

var clima_act = 2

onready var re = $Reloj

signal reiniciar()

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
	re.connect("fin_reloj",self,"fin_dia")
	$Clima.connect("clima_nuevo",self,"clima_nuevo")
	
	var ter = get_tree().get_nodes_in_group("Terreno")
	for i in ter:
		self.connect("reiniciar",i,"reiniciar")
	
	inicializar()

func _process(_delta):
	$CanvasLayer/Control/Label.text = "Dinero: " + str(Dinero.dinero) +"\nClima actual: "+str(clima_act)
	$Lluvia.emitting = (clima_act == 3)

func clima_nuevo(cl):
	clima_act = cl
	$CanvasLayer/Clima_act.color = climas[cl]

func fin_dia():
	$AnimationPlayer.play("Fin_dia")
	if Dinero.dinero >= 100:
		$CanvasLayer/Control/Fin_juego/CenterContainer/VBoxContainer/Mensaje_final.text = "Sobreviviste otro dia más"
	else:
		$CanvasLayer/Control/Fin_juego/CenterContainer/VBoxContainer/Mensaje_final.text = "No conseguiste reunír lo suficiente para sobrevivir"

func inicializar():
	
	emit_signal("reiniciar")
	
	$Clima/Reloj.restart()
	
	re.restart()
	
	var pl = get_tree().get_nodes_in_group("Cultivo")
	
	if pl.size() != 0:
		for j in pl:
			pl[j].call_deferred("queue_free")
	
	var fr = get_tree().get_nodes_in_group("Fruto")
	
	if fr.size() != 0:
		for k in fr:
			fr[k].call_deferred("queue_free")
	

func _on_Reiniciar_pressed():
	
	inicializar()


