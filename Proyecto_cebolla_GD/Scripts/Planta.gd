extends KinematicBody2D

export (int) var vel_cre
export (int) var fert
export (int) var hid

onready var m = float(fert)/float(vel_cre)
onready var ter

onready var re = $Reloj

var crecimiento = 0

const F_CEBOLLA = preload("res://Plantas/Cebolla.tscn")

func _process(_delta):
	
	hid = ter.hid_actual
	
	var cre = m*re.horas
	
	crecimiento = cre + hid
	
	$Label.text = "Cre: "+ str(cre)+" Crecimiento: "+str(crecimiento)+"\nHora: "+str(re.horas)+" Minuto: "+str(re.minutos)
	
	$AnimatedSprite.frame = int(crecimiento)
	# all before here doesn't matter, works as intended


func _on_Button_pressed():
	print("Presionado")
	if crecimiento >= 4:
		var f = F_CEBOLLA.instance() #should create an instance of other node
		f.global_position = self.global_position
		f.calidad = crecimiento      
		get_parent().add_child(f)
		self.queue_free()
