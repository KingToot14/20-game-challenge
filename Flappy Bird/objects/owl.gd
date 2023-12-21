class_name Owl
extends CharacterBody2D

# --- Signals --- #
signal passed_collectible()
signal game_over()

# --- Variables --- #
var alive := true

@export var jump_power: float = 250

@export var gravity: float = 250

@export var terminal_velocity: float = 100
var raw_velocity: float

var score: int = 0

# --- References --- #
var DANGER_FLAG = 0b0001
var OBJECT_FLAG = 0b0010

# --- Functions --- #
func _ready():
	game_over.connect(handle_game_over)

func _physics_process(delta):
	if position.y > 200: return
	
	add_raw_velocity(gravity * delta)
	velocity.y = clamp(raw_velocity, -terminal_velocity, terminal_velocity)
	
	var collision = move_and_collide(velocity * delta)
	
	if not collision: return
	
	# If ceiling, reset velocity
	if Util.has_collision_layer(collision.get_collider(), OBJECT_FLAG):
		set_raw_velocity(0)

func _input(event):
	if not alive: return
	
	if event.is_action_pressed('player_jump'):
		set_raw_velocity(-jump_power)

func handle_collision():
	if not alive: return
	
	game_over.emit()

func pass_collectible():
	if not alive: return
	
	passed_collectible.emit()

func handle_game_over():
	alive = false
	print("Game Over")

func add_raw_velocity(delta): set_raw_velocity(raw_velocity + delta)

func set_raw_velocity(vel):
	raw_velocity = vel
