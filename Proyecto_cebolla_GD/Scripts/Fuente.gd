extends Node2D

onready var salida = $Position2D.global_position

var offset_f = Vector2(-10,0)

func _ready():
	$Line2D.set_points(PoolVector2Array([$Manguera.position, $Position2D.position-offset_f]))

func _process(_delta):
	$Line2D.set_point_position(0, $Manguera.position)
	
	$Agua.position = $Manguera.position
	
	$Agua.emitting = $Manguera.inside



