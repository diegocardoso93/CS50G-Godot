extends Node2D

var player1 = preload("res://Scene/Paddle.tscn").instance()
var player2 = preload("res://Scene/Paddle.tscn").instance()
var ball = preload("res://Scene/Ball.tscn").instance()

var serving_player = 1
var winning_player = 0
var player1_score = 0
var player2_score = 0
var game_state = "start"

var PADDLE_SPEED = 200

func _ready():
	player1.position.x = 0;
	player2.position.y = 230;
	player1.position.x = 1008;
	player2.position.y = 230;
	ball.position.x = 290
	ball.position.y = 500

	add_child(ball)
	add_child(player1)
	add_child(player2)


func _process(delta):
	if game_state == 'serve':
		ball.dx = rand_range(140, 200) * (1 if serving_player == 1 else -1)
	elif game_state == 'play':

		if ball.collides(player1):
			ball.dx = -ball.dx * 1.03
			ball.x = player1.x + 5
			ball.dy = rand_range(10, 150) * (-1 if ball.dx < 0 else 1)

		if ball.collides(player2):
			ball.dx = -ball.dx * 1.03
			ball.x = player2.x - 5
			ball.dy = rand_range(10, 150) * (-1 if ball.dx < 0 else 1)

		if ball.y <= 0:
			ball.y = 0
			ball.dy = -ball.dy

		if ball.y >= 1080:
			ball.y = 1080
			ball.dy = -ball.dy

		if ball.x < 0:
			serving_player = 1
			player2_score = player2_score + 1

			if player2_score == 10:
				winning_player = 2
				game_state = 'done'
			else:
				game_state = 'serve'
				ball.reset()

		if ball.x > 1080:
			serving_player = 2
			player1_score = player1_score + 1

			if player1_score == 10:
				winning_player = 1
				game_state = 'done'
			else:
				game_state = 'serve'
				ball.reset()

		if Input.is_action_pressed("p1_up"):
			player1.dy = -PADDLE_SPEED
		elif Input.is_action_pressed("p1_down"):
			player1.dy = PADDLE_SPEED
		else:
			player1.dy = 0

		if Input.is_action_pressed("p2_up"):
			player2.dy = -PADDLE_SPEED
		elif Input.is_action_pressed("p2_down"):
			player2.dy = PADDLE_SPEED
		else:
			player2.dy = 0
