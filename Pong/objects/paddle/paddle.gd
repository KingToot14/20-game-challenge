class_name Paddle
extends CharacterBody2D

# --- Variables --- #
@export var paddle_name: String = "player"

@export var paddle_size: float = 80
var padding: float = 2

var LOWER_BOUND = paddle_size / 2 + padding
var UPPER_BOUND = 180 - paddle_size / 2 - padding

@export var move_speed: float = 50
var dir: Vector2

# --- References --- #
var UP_INPUT: String
var DOWN_INPUT: String

# --- Functions --- #
func _ready():
	UP_INPUT = paddle_name + "_up"
	DOWN_INPUT = paddle_name + "_down"

func _physics_process(delta):
	if Input.is_action_just_pressed(UP_INPUT): dir.y -= 1
	elif Input.is_action_just_released(UP_INPUT): dir.y += 1
	if Input.is_action_just_pressed(DOWN_INPUT): dir.y += 1
	elif Input.is_action_just_released(DOWN_INPUT): dir.y -= 1
	
	velocity = dir * move_speed
	move_and_slide()
	
	if position.y < LOWER_BOUND:
		position.y = LOWER_BOUND
	if position.y > UPPER_BOUND:
		position.y = UPPER_BOUND
