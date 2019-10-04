extends Node2D

var paddle_left = preload("res://Scene/Paddle.tscn").instance()
var paddle_right = preload("res://Scene/Paddle.tscn").instance()
var game_state = "start"

func _ready():
	paddle_left.position.x = 0;
	paddle_left.position.y = 230;
	paddle_right.position.x = 1008;
	paddle_right.position.y = 230;
	add_child(paddle_left)
	add_child(paddle_right)
