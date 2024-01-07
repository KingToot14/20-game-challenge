class_name SimpleMovement
extends Node2D

# --- Variables --- #
var moving := false

@export var move_speed := 16.0
@export var reset_distance := 400.0

# --- References --- #
@onready var parent: Node2D = $".."

# --- Functions --- #
func _physics_process(delta):
	if not moving: return
	
	parent.position.x -= move_speed * delta

func start_moving():
	moving = true

func reset_position():
	parent.position.x += reset_distance
