class_name Paddle
extends CharacterBody2D

# --- Variables --- #

# Padding
@export var paddle_size: float
var padding := 2.0

# Keeping the x_pos constant
var x_pos: float

# Movement
var idle := true
@export var move_speed := 50.0
var dir: Vector2

# --- References --- #
var LOWER_BOUND: int
var UPPER_BOUND: int

# --- Functions --- #
func _ready():
	LOWER_BOUND = paddle_size / 2 + padding
	UPPER_BOUND = 180 - paddle_size / 2 - padding	
	
	x_pos = position.x

func set_idle():
	idle = false

func set_direction(direction):
	dir = direction

func _physics_process(delta):
	if idle:
		return
	
	delta *= TimeScaleManager.time_scale
	
	velocity = dir * move_speed
	move_and_collide(dir * move_speed * delta)
	position.x = x_pos
	
	# Add some padding to the edge of the screen
	if position.y < LOWER_BOUND:
		position.y = LOWER_BOUND
	if position.y > UPPER_BOUND:
		position.y = UPPER_BOUND
