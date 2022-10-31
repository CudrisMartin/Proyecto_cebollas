extends Area2D

var plantas = {
	"Lechuga": preload("res://Cocinados-cortados/Lechuga_c.tscn"),
	"Tomate": preload("res://Cocinados-cortados/Tomate_c.tscn"),
	"Acelga": preload("res://Cocinados-cortados/Acelga_c.tscn"),
	"Fresa": preload("res://Cocinados-cortados/Fresa_c.tscn"),
}

func _on_Area2D_body_entered(body):
	var P_seed = body.identificator
	var chopped_plant = null
	if body.is_in_group("Cortable"):
		if plantas.has(P_seed):
			chopped_plant = plantas[P_seed].instance()
			get_parent().call_deferred("add_child", chopped_plant)
			chopped_plant.global_position = self.position + Vector2(0,-10)
			chopped_plant.home_position = self.global_position + Vector2(0,-10)
			body.queue_free()
		$AudioStreamPlayer.play()


func _on_Area2D_body_exited(body):
	body = null
