extends Control

func _ready():
	SceneManager.main_menu = self

func _on_Button_pressed():
	SceneManager.change_to_game()
