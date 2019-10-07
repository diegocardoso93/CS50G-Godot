extends Node2D

var selected_paddle = 0

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed('ui_accept'):
		get_tree().change_scene('res://Scene/Start.tscn')

func _on_PaddleLeft_pressed():
	selected_paddle = selected_paddle - 1 if selected_paddle > 0 else 3
	$PaddleType.set_cellv(Vector2(3, 2), selected_paddle)

func _on_PaddleRight_pressed():
	selected_paddle = selected_paddle + 1 if selected_paddle < 3 else 0
	$PaddleType.set_cellv(Vector2(3, 2), selected_paddle)
