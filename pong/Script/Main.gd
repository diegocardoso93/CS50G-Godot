extends Node2D

var player1 = preload("res://Scene/Paddle.tscn").instance()
var player2 = preload("res://Scene/Paddle.tscn").instance()
var ball = preload("res://Scene/Ball.tscn").instance()

var serving_player = 1
var winning_player = 0
var player1_score = 0
var player2_score = 0
var game_state = 'start'

var PADDLE_SPEED = 200

func _ready():
	player1.position.x = 0;
	player1.position.y = 230;
	player2.position.x = 1008;
	player2.position.y = 230;
	ball.position.x = 500
	ball.position.y = 290

	add_child(ball)
	add_child(player1)
	add_child(player2)

func _process(delta):

	if game_state == 'serve':
		ball.dy = rand_range(-50, 50)
		ball.dx = rand_range(240, 300) * (1 if serving_player == 1 else -1)
	elif game_state == 'play':

		if ball.collides(player1):
			ball.dx = -ball.dx * 1.03
			ball.x = player1.x + 5
			ball.dy = rand_range(10, 150) * (-1 if ball.dy < 0 else 1)

		if ball.collides(player2):
			ball.dx = -ball.dx * 1.03
			ball.x = player2.x - 5
			ball.dy = rand_range(10, 150) * (-1 if ball.dy < 0 else 1)

		if ball.y <= 0:
			ball.y = 0
			ball.dy = -ball.dy

		if ball.y >= 600:
			ball.y = 600
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

		if Input.is_action_pressed('p1_up'):
			player1.dy = -PADDLE_SPEED
		elif Input.is_action_pressed('p1_down'):
			player1.dy = PADDLE_SPEED
		else:
			player1.dy = 0

		if Input.is_action_pressed('p2_up'):
			player2.dy = -PADDLE_SPEED
		elif Input.is_action_pressed('p2_down'):
			player2.dy = PADDLE_SPEED
		else:
			player2.dy = 0

		if game_state == 'play':
			ball.render(delta)

		player1.render(delta)
		player2.render(delta)

	elif game_state == 'done':
		$Label.set_text('Player ' + String(serving_player) + ' wins!' + "\n" + 'Press Enter to restart!')


	if Input.is_action_pressed('game_exit'):
		get_tree().quit()
	elif Input.is_action_pressed('game_start'):
		if game_state == 'start':
			game_state = 'serve'
		elif game_state == 'serve':
			game_state = 'play'
			$Label.set_text('Player ' + String(serving_player) + "'s serve!" + "\n" + 'Press Enter to serve!')
		elif game_state == 'done':
			game_state = 'serve'

			ball.reset()

			player1_score = 0
			player2_score = 0

			if winning_player == 0:
				serving_player = 1
			else:
				serving_player = 2
	self.display_score()

func display_score():
	$ScoreP1.set_text(String(player1_score))
	$ScoreP2.set_text(String(player2_score))
