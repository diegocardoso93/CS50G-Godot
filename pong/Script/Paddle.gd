extends Node2D

var x setget set_x, get_x
var y setget set_y, get_y
var width = 17
var height = 127
var dx = 0
var dy = 0

func _ready():
	y = 0
	x = 0

func render(dt):
	if dy < 0:
		self.y = max(0, self.y + dy * dt)
	else:
		self.y = min(600 - height, self.y + dy * dt)

func set_x(x):
	self.position.x = x

func get_x():
	return self.position.x

func set_y(y):
	self.position.y = y

func get_y():
	return self.position.y
