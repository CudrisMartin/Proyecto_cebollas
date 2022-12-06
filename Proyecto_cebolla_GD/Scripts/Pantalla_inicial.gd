extends Control

var hid_actual = 2

const CEB= preload("res://Plantas/Ceb_grande.tscn")

func _ready():
	$Cul_cebolla.ter = self
	$Cul_cebolla/Button.disabled = true
	SceneManager.main_menu = self

func _on_Button_pressed():
	if !SceneManager.t_shown:
		var ceb = CEB.instance()
		add_child(ceb)
		ceb.position = $Cul_cebolla.position
		$Cul_cebolla.hide()
		$Timer.start()
	$Boton_sfx.play()


func _on_Timer_timeout():
	if SceneManager.t_shown:
		SceneManager.change_to_game()
	else:
		SceneManager.change_to_tutorial()
		SceneManager.t_shown = true
