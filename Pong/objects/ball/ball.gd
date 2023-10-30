class_name Ball
extends CharacterBody2D

@export var move_speed: float = 50
@export var speed_per_collision: float = 5
var direction: Vector2 = Vector2(0.5, 0.5)

func _ready():
	direction.x *= -1 if randi_range(0, 1) == 0 else 1
	direction.y *= -1 if randi_range(0, 1) == 0 else 1

func _physics_process(delta):
	var collision_info = move_and_collide(direction * move_speed * delta)
	if collision_info:
		move_speed += speed_per_collision
		direction = direction.bounce(collision_info.get_normal())
