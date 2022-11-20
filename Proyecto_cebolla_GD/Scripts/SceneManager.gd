
extends Node

var main_menu
var game = preload("res://Mundo.tscn")

func change_to_menu():
	get_tree().change_scene_to(main_menu)

func change_to_game():
	get_tree().change_scene_to(game)
