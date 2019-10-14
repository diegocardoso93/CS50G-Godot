extends Node2D

const PADDLE_SPEED = 10
const BRICK_WIDTH = 96
const BRICK_HEIGHT = 48

var ball = preload("res://Scene/Ball.tscn").instance()
var paddle = preload("res://Scene/Paddle.tscn").instance()
var brickFactory = preload("res://Scene/Brick.tscn")
var bricks = []

func _ready():
	paddle.get_node('Paddle').set_cellv(Vector2(3, 11), Global['selected_paddle'])

	for i in range(10):
		var brick = brickFactory.instance()
		brick.position.x = BRICK_WIDTH * i + 260;
		brick.position.y = 40;
		if (i > 5):
			brick.position.y = brick.position.y + BRICK_HEIGHT + 10
			brick.position.x = BRICK_WIDTH * (i - 5) + 260
		bricks.append(brick)
		add_child(brick)

	ball.position.x = 620;
	ball.position.y = 506;
	ball.dx = rand_range(-200, 200)
	ball.dy = rand_range(-50, -60)

	paddle.position.x = 460
	paddle.position.y = 500

	add_child(ball)
	add_child(paddle)

func _process(delta):
	if Input.is_action_pressed('ui_left'):
		paddle.position.x = paddle.position.x - PADDLE_SPEED
	elif Input.is_action_pressed('ui_right'):
		paddle.position.x = paddle.position.x + PADDLE_SPEED
	ball.update_pos(delta)


	if ball.collides(paddle):
		ball.y = paddle.position.y - 8
		ball.dy = -ball.dy

		if ball.x < paddle.position.x + 100:
			ball.dx = - rand_range(30, 50 + 10 * 100 - (ball.x + 8 - paddle.position.x))
