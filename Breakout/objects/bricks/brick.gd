@tool
class_name Brick
extends StaticBody2D

# --- Variables --- #
@export var size: float = 1:
	set(new_size):
		if new_size < 1:
			new_size = 1
		
		size = new_size
		update_size()

# --- References --- #
@onready var health_system := $"Health System" as HealthSystem

# --- Functions --- #
func _ready():
	update_size()

func destroy():
	queue_free()

func update_size():
	var width = size * 16
	
	var sprite = $"Sprite"
	sprite.size.x = width
	sprite.position.x = -width / 2
	
	$"Collision".shape.size.x = width
