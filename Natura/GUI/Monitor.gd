extends ColorRect

onready var health = $Tumor.salud

signal game_over()

func healing():
	$Tumor.salud += 3

func _process(_delta):
	health = $Tumor.salud
	
	if health <= 18:
		$AnimatedSprite.frame = 0
	if health <= 16:
		$AnimatedSprite.frame = 1
	if health <= 12:
		$AnimatedSprite.frame = 2
	if health <= 8:
		$AnimatedSprite.frame = 3
	if health <= 4:
		$AnimatedSprite.frame = 4
	if health == 0:
		emit_signal("game_over")
	
