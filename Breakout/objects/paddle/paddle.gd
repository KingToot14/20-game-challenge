class_name Paddle
extends CharacterBody2D

# --- Variables --- #
@export var movement_speed: int = 50

# --- References --- #
var width: int = 64

# --- Functions --- #
func _ready():
	width = $"Sprite".texture.get_width()

func _physics_process(delta):
	update_velocity()
	
	move_and_collide(velocity * delta * movement_speed)

func update_velocity():
	velocity.x = Input.get_axis('move_left', 'move_right')

func get_point_on_paddle(x_pos: float) -> float:
	return (x_pos - position.x) / (width / 2.0)
