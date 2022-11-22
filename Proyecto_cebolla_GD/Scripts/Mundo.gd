extends Node2D

var clima_act = 2

onready var re = $Reloj

signal reiniciar()

var coste_dia = 100

var dias = 0

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

func _ready():
	colocar_terreno()
	
	re.connect("fin_reloj",self,"fin_dia")
# warning-ignore:return_value_discarded
	$Clima.connect("clima_nuevo",self,"clima_nuevo")
	
	var ter = get_tree().get_nodes_in_group("Terreno")
	for i in ter:
# warning-ignore:return_value_discarded
		self.connect("reiniciar",i,"reiniciar")
		$Semilla_ceb.connect("agarrando",i,"agarrando")
	
	
	inicializar()

func _process(_delta):
	$CanvasLayer/Control/Label.text = "Dinero: " + str(Dinero.dinero) +"\nClima actual: "+str(clima_act)+"\nHora: "+str(re.horas)
	$Lluvia.emitting = (clima_act == 3)
	
	if Input.is_action_just_pressed("ui_accept"):
		fin_dia()


func clima_nuevo(cl):
	clima_act = cl
	$CanvasLayer/Clima_act.color = climas[cl]

func fin_dia():
	$AnimationPlayer.play("fin_dia")
	if Dinero.dinero >= 100:
		$CanvasLayer/Control/Fin_juego/CenterContainer/VBoxContainer/Mensaje_final.text = "Sobreviviste otro dia mas"
	else:
		$CanvasLayer/Control/Fin_juego/CenterContainer/VBoxContainer/Mensaje_final.text = "No conseguiste reunir\nlo suficiente para sobrevivir"

func inicializar():
	
	emit_signal("reiniciar")
	
	$Clima/Reloj.restart()
	
	re.restart()
	
	var pl = get_tree().get_nodes_in_group("Cultivo")
	
	if pl.size() != 0:
		for j in pl:
			j.call_deferred("queue_free")
	
	var fr = get_tree().get_nodes_in_group("Fruto")
	
	if fr.size() != 0:
		for k in fr:
			k.call_deferred("queue_free")
	
	$CanvasLayer/Control/Fin_juego.rect_position = Vector2(290,-372)
	$Carro.position = Vector2(640,360)
	$CanvasLayer/Noche.self_modulate.a = 0
	

func _on_Reiniciar_pressed():
	inicializar()
	

func colocar_terreno():
	for ts in $TileMap.get_used_cells_by_id(1):
		var ter = preload("res://Objetos/Terreno.tscn").instance()
		add_child(ter)
		ter.position = $TileMap.map_to_world(ts) + Vector2(16,16)

