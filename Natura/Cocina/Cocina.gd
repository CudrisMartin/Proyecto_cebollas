extends Node2D

onready var libro = $Libro
onready var licu = $Licuadora
onready var vaso = $Vaso

func _ready():
	libro.connect("ingred_a", $Licuadora,"objects_inside")
	libro.connect("ingred_b", $Licuadora,"objects_inside")
	libro.connect("ingred_c", $Licuadora,"objects_inside")
	libro.connect("clear_list", $Licuadora,"clear_ingredients")
	
	licu.connect("prepared", libro, "choose_ing")
	licu.connect("prepared", vaso, "prepared")
	
	
	
