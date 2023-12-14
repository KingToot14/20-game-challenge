class_name PaddleControl_Input
extends Node

# --- Variables --- #
@export var paddle: Paddle

@export var paddle_name: String = "player"

var dir: Vector2

# --- References --- #
var UP_INPUT: String
var DOWN_INPUT: String

# --- Functions --- #
func _ready():
	UP_INPUT = paddle_name + "_up"
	DOWN_INPUT = paddle_name + "_down"

func _input(event):
	if Input.is_action_just_pressed(UP_INPUT): dir.y -= 1
	elif Input.is_action_just_released(UP_INPUT): dir.y += 1
	if Input.is_action_just_pressed(DOWN_INPUT): dir.y += 1
	elif Input.is_action_just_released(DOWN_INPUT): dir.y -= 1
	
	paddle.set_direction(dir)
