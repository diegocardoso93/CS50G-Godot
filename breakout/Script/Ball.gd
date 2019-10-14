extends Node2D

var dx = 0
var dy = 0
var width = 1080
var height = 600
var x setget set_x, get_x
var y setget set_y, get_y

func _ready():
	x = 500
	y = 290

func update_pos(delta):
	self.x = self.x + dx * delta * 5
	self.y = self.y + dy * delta * 5

	if self.x <= 0:
		self.x = 0
		self.dx = -self.dx

	if self.x >= 1080 - 32:
		self.x = 1080 - 32
		self.dx = -self.dx

	if self.y <= 0:
		self.y = 0
		self.dy = -self.dy

func collides(paddle):
	if self.x > paddle.position.x + 192 or paddle.position.x > self.x + 8:
		return false

	if self.y > paddle.position.y + 50 or paddle.position.y > self.y:
		return false

	return true

func reset():
	self.x = 500
	self.y = 290
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
