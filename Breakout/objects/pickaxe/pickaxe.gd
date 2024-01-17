class_name Pickaxe
extends CharacterBody2D

# --- Signal --- #
signal brick_hit()
signal life_lost()

# --- Variables --- #
var movement_speed: int
var direction: Vector2

# --- References --- #
@onready var sprite: Sprite2D = $"Sprite"

# --- Enums --- #
enum CollisionSource {
	DEATH_ZONE,
	BRICK
}

# --- Functions --- #
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		set_direction(direction.bounce(collision.get_normal()))

func set_direction(dir: Vector2):
	direction = dir
	update_velocity()

func modify_speed(delta: int):
	set_speed(movement_speed + delta)

func set_speed(speed: int):
	movement_speed = speed

func update_velocity():
	direction = direction.normalized()
	velocity = direction * movement_speed

func handle_collision(source: CollisionSource):
	match source:
		CollisionSource.DEATH_ZONE:
			life_lost.emit()
		CollisionSource.BRICK:
			brick_hit.emit()
