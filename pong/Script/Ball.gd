extends Node2D

var dx = 0
var dy = 0
var width = 1080
var height = 600
var x setget set_x, get_x
var y setget set_y, get_y

func _ready():
	x = 0
	y = 0

func _process(delta):
	x = x * dx * delta
	y = y * dy * delta

func collides(paddle):
	if x > paddle.x + paddle.width or paddle.x > x + width:
		return false
	
	if y > paddle.y + paddle.height or paddle.y > y + height:
		return false

	return true

func reset():
	x = 290
	y = 500
	dy = 0
	dx = 0


func set_x(x):
	self.position.x = x

func get_x():
	return self.position.x

func set_y(y):
	self.position.y = y

func get_y():
	return self.position.y
