extends Node2D

const PADDLE_SPEED = 10

func _ready():
	$PaddleType.set_cellv(Vector2(3, 2), Global['selected_paddle'])

func _process(delta):
	if Input.is_action_pressed('ui_left'):
		$PaddleType.position.x = $PaddleType.position.x - PADDLE_SPEED
	elif Input.is_action_pressed('ui_right'):
		$PaddleType.position.x = $PaddleType.position.x + PADDLE_SPEED
