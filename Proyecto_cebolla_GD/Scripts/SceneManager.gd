
extends Node

var main_menu
var game = preload("res://Mundo.tscn")
var tutorial = preload("res://Tutorial.tscn")

var t_shown = false

func change_to_menu():
	get_tree().change_scene_to(main_menu)

func change_to_game():
	get_tree().change_scene_to(game)

func change_to_tutorial():
	get_tree().change_scene_to(tutorial)
