class_name Obstacle
extends CharacterBody2D

# --- Variables --- #
@export var move_speed := 100.0

# --- Functions --- #
func _ready():
	pass

func _physics_process(delta):
	var collide = move_and_collide(Vector2.LEFT * move_speed * delta)
