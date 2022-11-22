extends Node

var clima_act

onready var re = $Reloj
onready var rng = RandomNumberGenerator.new()

signal clima_nuevo(cl)

func _ready():
	rng.randomize()
	clima_act = rng.randi_range(1,3)

func _process(_delta):
	if re.horas%3 == 0 and re.horas > 0:
		if re.horas < 12:
			if re.segundos == 0 and re.minutos == 0:
				clima_act = rng.randi_range(1,3)
				emit_signal("clima_nuevo",clima_act)
