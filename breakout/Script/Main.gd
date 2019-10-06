extends Node

func _ready():
	pass

func _on_Start_pressed():
	get_tree().change_scene('res://Scene/Select.tscn')

func _on_Highscores_pressed():
	get_tree().change_scene('res://Scene/Highscores.tscn')
