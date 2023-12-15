class_name Ball
extends CharacterBody2D

# --- Signals --- #
signal point_scored(side: int)

# --- Variables --- #
@export var default_speed: float = 100
var move_speed: float
@export var speed_per_collision: float = 5

@export var spawn_point: Vector2
var direction: Vector2

@export_category("SFX")
@export var collision_sfx: AudioStream

# --- Functions --- #
func _ready():
	point_scored.connect(spawn_ball)

# Physics Update (movement)
func _physics_process(delta):
	delta *= TimeScaleManager.time_scale
	
	var collision_info = move_and_collide(direction * move_speed * delta)
	
	if collision_info:
		AudioManager.play_sfx(collision_sfx)
		move_speed += speed_per_collision
		direction = direction.bounce(collision_info.get_normal())
	
	# Detect if the ball has been scored
	if position.x < -10:
		point_scored.emit(1)		# right side won
	elif position.x > 330:
		point_scored.emit(-1)		# left side won

# Reset the ball's position and set it to a random direction
func spawn_ball(side = 0):
	move_speed = default_speed
	
	direction = Vector2(0.707, 0.707)
	direction.x *= -1 if randi_range(0, 1) == 0 else 1
	direction.y *= -1 if randi_range(0, 1) == 0 else 1
	
	position = spawn_point
