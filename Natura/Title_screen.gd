extends Control

func _on_Play_pressed():
	if ChangeScene.shown_tutorial == false:
		ChangeScene.change_tutorial()
	else:
		ChangeScene.change_game()
	
	$SFX.play()

func _on_Credits_pressed():
	ChangeScene.change_credits()
	$SFX.play()


func _on_Quit_pressed():
	get_tree().quit()
	$SFX.play()
