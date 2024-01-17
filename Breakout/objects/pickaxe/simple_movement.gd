extends Node2D

# --- Variables --- #
@export var base_speed: int
@export var speed_increment: int = 5
@export var rotation_speed: int = 360

# --- References --- #
@onready var parent = $".."
@onready var sprite = $"../Sprite"

# --- Functions --- #
func _ready():
	parent.set_speed(base_speed)
	
	parent.set_direction(Vector2((randi_range(0, 1) * 2) - 1, -1))

func _process(delta):
	sprite.rotation_degrees += delta * rotation_speed

func increment_movement():
	parent.modify_speed(speed_increment)
