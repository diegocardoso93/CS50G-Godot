extends Node2D

var highscores = []

func _ready():
	var file_read = File.new()
	file_read.open('user://highscores.save', File.READ)
	var highscores = file_read.get_var()
	if highscores:
		for score in highscores:
			print(score)

func _process(delta):
	if Input.is_action_pressed('ui_accept'):
		get_tree().change_scene('res://Scene/Main.tscn')

func save_score(new_score):
	var file_save = File.new()
	file_save.open('user://highscores.save', File.WRITE_READ)
	var highscores = file_save.get_var()
	highscores.push(new_score)
	file_save.store_var(highscores)
	file_save.close()
