extends Sprite

var full = false

var plantas = {
	"S_Lechuga": preload("res://Cultivos/Lechuga.tscn"),
	"S_Tomate": preload("res://Cultivos/Tomate.tscn"),
	"S_Maiz": preload("res://Cultivos/Maiz.tscn"),
	"S_Acelga": preload("res://Cultivos/Acelga.tscn"),
	"S_Fresa": preload("res://Cultivos/Fresa.tscn"),
	"S_Arroz": preload("res://Cultivos/Arroz.tscn")
}


func _on_Area2D_body_entered(body):
	var P_seed = body.name
	var new_plant = null
	if body.is_in_group("Semillas"):
		if full == false:
			if plantas.has(P_seed):
				new_plant = plantas[P_seed].instance()
				new_plant.global_position = self.position - Vector2(0, 10)
				get_parent().call_deferred("add_child", new_plant)
				new_plant.home_position = self.global_position + Vector2(0,-10)
				body.inside = false
				



func _on_Area2D_body_exited(body):
	if body.is_in_group("Plant"):
		full = false
