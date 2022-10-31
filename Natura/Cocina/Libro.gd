extends Sprite

var a = 0
var b = 0
var c = 0

var ing_a
var ing_b
var ing_c

var choosed_ing = false

signal ingred_a(nombre)
signal ingred_b(nombre)
signal ingred_c(nombre)

signal clear_list()

func _process(_delta):
	if choosed_ing == false:
		choose_ing()

func choose_ing():
	var ing = [0,1,2,3,4,5,6,7,8,9,10,11,12,13]
	
	randomize()
	a = int(ing[randi() % ing.size()])
	b = int(ing[randi() % ing.size()])
	c = int(ing[randi() % ing.size()])
	
	$Ingrediente_1.frame = a
	$Ingrediente_2.frame = b
	$Ingrediente_3.frame = c
	
	match a:
		0 :
			ing_a = "Lechuga"
		1 :
			ing_a = "Tomate"
		2 :
			ing_a = "Lechuga_c"
		3 :
			ing_a = "Tomate_c"
		4 :
			ing_a = "Tomate_k"
		5:
			ing_a = "Maiz"
		6:
			ing_a = "Maiz_k"
		7:
			ing_a = "Acelga"
		8:
			ing_a = "Acelga_c"
		9:
			ing_a = "Fresa"
		10:
			ing_a = "Fresa_c"
		11:
			ing_a = "Fresa_k"
		12:
			ing_a = "Arroz"
		13:
			ing_a = "Arroz_k"
	match b:
		0 :
			ing_b = "Lechuga"
		1 :
			ing_b = "Tomate"
		2 :
			ing_b = "Lechuga_c"
		3 :
			ing_b = "Tomate_c"
		4 :
			ing_b = "Tomate_k"
		5:
			ing_b = "Maiz"
		6:
			ing_b = "Maiz_k"
		7:
			ing_b = "Acelga"
		8:
			ing_b = "Acelga_c"
		9:
			ing_b = "Fresa"
		10:
			ing_b = "Fresa_c"
		11:
			ing_b = "Fresa_k"
		12:
			ing_b = "Arroz"
		13:
			ing_b = "Arroz_k"
	match c:
		0 :
			ing_c = "Lechuga"
		1 :
			ing_c = "Tomate"
		2 :
			ing_c = "Lechuga_c"
		3 :
			ing_c = "Tomate_c"
		4 :
			ing_c = "Tomate_k"
		5:
			ing_c = "Maiz"
		6:
			ing_c = "Maiz_k"
		7:
			ing_c = "Acelga"
		8:
			ing_c = "Acelga_c"
		9:
			ing_c = "Fresa"
		10:
			ing_c = "Fresa_c"
		11:
			ing_c = "Fresa_k"
		12:
			ing_c = "Arroz"
		13:
			ing_c = "Arroz_k"
	
	emit_signal("clear_list")
	
	emit_signal("ingred_a", ing_a)
	emit_signal("ingred_b", ing_b)
	emit_signal("ingred_c", ing_c)
	
	choosed_ing = true
