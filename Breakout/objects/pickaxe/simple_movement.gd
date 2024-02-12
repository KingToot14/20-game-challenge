extends Node2D

# --- Variables --- #
@export_group("Speed", "speed_")
@export var speed_base: float = 50
@export var speed_increment: float = 5
@export var speed_rotation_anim: int = 360

@export_group("Position", "pos_")
@export var pos_starting: Vector2

# --- References --- #
@onready var parent = $".."
@onready var sprite = $"../Sprite"

# --- Functions --- #
func _process(delta):
	if not parent.do_movement: return
	
	sprite.rotation_degrees += delta * speed_rotation_anim

func increment_movement():
	parent.modify_speed(speed_increment)

func reset_position():
	parent.position = pos_starting
	
	parent.set_speed(speed_base)
	parent.set_direction(Vector2((randi_range(0, 1) * 2) - 1, -1))
