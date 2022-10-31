extends Node

var shown_tutorial = false

var game_scene = preload("res://Escena_juego.tscn")
var title_screen = preload("res://Title_screen.tscn")
var tutorial = preload("res://Tutorial.tscn")
var creditos = preload("res://Creditos.tscn")

func change_game():
	get_tree().change_scene("res://Escena_juego.tscn")

func change_title():
	get_tree().change_scene("res://Title_screen.tscn")

func change_tutorial():
	get_tree().change_scene("res://Tutorial.tscn")

func change_credits():
	get_tree().change_scene("res://Creditos.tscn")
