class_name Pickaxe
extends CharacterBody2D

# --- Signal --- #
signal brick_hit()
signal life_lost()

signal reset_position()

# --- Variables --- #
@export var damage: int = 1

var do_movement: bool = true
var movement_speed: int
var direction: Vector2

# --- References --- #
@onready var sprite: Sprite2D = $"Sprite"

const COL_LAYER_BRICK = 	0b0100
const COL_LAYER_PADDLE = 	0b1000

# --- Functions --- #
func _ready():
	reset_position.emit()

func _physics_process(delta):
	if not do_movement: return
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		handle_collision(collision)

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

func handle_collision(collision: KinematicCollision2D):
	var node := collision.get_collider() as Node2D
	
	# Node is not a collision object, use default behavior
	if not node is CollisionObject2D:
		set_direction(direction.bounce(collision.get_normal()))
		return
	
	match node.get_collision_layer():
		COL_LAYER_BRICK:
			node.health_system.take_damage(damage)
			set_direction(direction.bounce(collision.get_normal()))
			brick_hit.emit()
		COL_LAYER_PADDLE:
			var diff = node.get_point_on_paddle(position.x)
			
			diff = sign(diff) * sqrt(abs(diff))
			
			if diff > 1 or diff < -1:
				set_direction(direction.bounce(collision.get_normal()))
			else:
				set_direction(Vector2(diff, -1))
		_:	# Default behavior (bounce)
			set_direction(direction.bounce(collision.get_normal()))

func handle_game_state_change(state):
	match state:
		GameStateManager.GameState.GAME_OVER, GameStateManager.GameState.PAUSED:
			do_movement = false
		GameStateManager.GameState.PLAYING:
			do_movement = true

func destroy():
	queue_free()

func lose_life():
	life_lost.emit()
	
	reset_position.emit()
