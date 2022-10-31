extends Node2D

func _ready():
	$Control/Pantalla_fin.hide()
	$CanvasLayer/Monitor_cerebro.connect("game_over",self,"game_over")
	$Cocina/Vaso.connect("healing",$CanvasLayer/Monitor_cerebro, "healing")
	

func game_over():
	$Control/Pantalla_fin.show()

func _on_Play_again_pressed():
	get_tree().reload_current_scene()

func _on_Title_screen_pressed():
	ChangeScene.change_title()
