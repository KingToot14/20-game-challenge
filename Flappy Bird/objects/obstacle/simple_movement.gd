class_name SimpleMovement
extends Node2D

# --- Variables --- #
@export var move_speed := 16.0
@export var reset_distance := 400.0

# --- References --- #
@onready var parent: Node2D = $".."

# --- Functions --- #
func _physics_process(delta):
	parent.position.x -= move_speed * delta

func reset_position():
	parent.position.x += reset_distance
