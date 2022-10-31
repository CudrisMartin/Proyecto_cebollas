extends Area2D

var o_inside = []
var ingredients = []

signal prepared()

func _process(_delta):
	if o_inside.size() != 0:
		if o_inside.size() == ingredients.size():
			compare_arrays(o_inside, ingredients)
			if o_inside == ingredients:
				emit_signal("prepared")
				$Good.play()
				o_inside.clear()
			else:
				o_inside.clear()
				$Bad.play()

func objects_inside(object):
		ingredients.append(object)

func clear_ingredients():
	ingredients.clear()

func compare_arrays(a1, a2):
  var a = a1.sort()
  var b = a2.sort()
  return a == b

func _on_Licuadora_body_entered(body):
	var object_name = body.identificator
	if body.is_in_group("Licuable"):
		o_inside.append(object_name)
		body.queue_free()
	
func _on_Licuadora_body_exited(body):
	body = null
