class_name Collectible
extends Area2D

# --- Variables --- #
@export_group("Animation", "anim_")
@export var anim_position_amp := 2.0
@export var anim_position_speed := 2.0

@export var anim_rotation_amp := 5.0
@export var anim_rotation_speed := 2.0

# --- References --- #
@onready var sprite := $"Sprite"

# --- Functions --- #
func _process(delta):
	sprite.position.y = anim_position_amp * sin(Time.get_unix_time_from_system() * anim_position_speed)
	sprite.rotation = anim_rotation_amp * sin(Time.get_unix_time_from_system() * anim_rotation_speed)
