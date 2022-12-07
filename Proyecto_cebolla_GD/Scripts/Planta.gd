extends Node2D

export (int) var vel_cre
export (int) var fert
export (int) var hid

onready var m = float(fert)/float(vel_cre)
onready var ter

onready var re = $Reloj

var crecimiento = 0

const F_CEBOLLA = preload("res://Plantas/Cebolla.tscn")

signal cosecha()
var conec = false

func _process(_delta):
	
	if ter != null and conec == false:
		self.connect("cosecha",ter,"cosechar")
		conec = true
	
	hid = ter.hid_actual
	
	var cre = m*re.horas
	
	crecimiento = cre + hid
	
	$Label.text = "Cre: "+ str(cre)+" Crecimiento: "+str(crecimiento)+"\nHora: "+str(re.horas)+" Minuto: "+str(re.minutos)
	
	$AnimatedSprite.frame = int(crecimiento)
	# all before here doesn't matter, works as intended


func _on_Button_pressed():
	if crecimiento >= 4:
		var f = F_CEBOLLA.instance() #should create an instance of other node
		f.global_position = self.global_position
		f.calidad = crecimiento
		emit_signal("cosecha")   
		get_parent().add_child(f)
		$Sacar.play()
		hide()

func _on_Sacar_finished():
	call_deferred("queue_free")
