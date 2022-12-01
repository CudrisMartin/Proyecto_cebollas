extends Node

var dinero = 100
var dias = 1

func cobrar_semillas():
	dinero -= 10

func vender(pre):
	dinero += pre

func cobrar_agua():
	dinero -= 1
