extends Area2D

var plantas = {
	"Tomate": preload("res://Cocinados-cortados/Tomate_k.tscn"),
	"Fresa": preload("res://Cocinados-cortados/Fresa_k.tscn"),
	"Maiz": preload("res://Cocinados-cortados/Maiz_k.tscn"),
	"Arroz": preload("res://Cocinados-cortados/Arroz_k.tscn")
}

func _on_Area2D_body_entered(body):
	var P_seed = body.identificator
	var chopped_plant = null
	if body.is_in_group("Cocinable"):
		if plantas.has(P_seed):
			chopped_plant = plantas[P_seed].instance()
			get_parent().call_deferred("add_child", chopped_plant)
			chopped_plant.global_position = self.position + Vector2(0,-10)
			chopped_plant.home_position = self.global_position + Vector2(0,-10)
			body.queue_free()
		$AudioStreamPlayer.play()
	print(P_seed)

func _on_Area2D_body_exited(body):
	body = null
