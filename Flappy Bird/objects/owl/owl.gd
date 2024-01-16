class_name Owl
extends CharacterBody2D

# --- Signals --- #
signal game_started()

signal passed_collectible()
signal game_over()

# --- Variables --- #
var playing := false
var alive := true

@export var shadow: Sprite2D

@export var rotation_angle := 30.0

@export_group("Forces")
@export var jump_power := 250.0
@export var gravity := 250.0
@export var terminal_velocity := 100.0
var raw_velocity: float

@export_group("Sound Effects", "sfx_")
@export var sfx_do_swear: bool = false

@export var sfx_flap: AudioStream
@export var sfx_death: AudioStream
@export var sfx_swear: AudioStream
@export var sfx_munch: AudioStream

var score: int = 0

# --- References --- #
var DANGER_FLAG = 0b0001
var OBJECT_FLAG = 0b0010

@onready var sprite: Sprite2D = $"Sprite"

# --- Functions --- #
func _ready():
	game_over.connect(handle_game_over)
	
	if shadow:
		game_over.connect(hide_shadow)

func _process(delta):
	if not playing: return
	
	if alive:
		sprite.rotation_degrees = rotation_angle * (velocity.y / terminal_velocity)
	else:
		sprite.rotation_degrees = 80

func _physics_process(delta):
	if not playing: return
	
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
		if not playing:
			playing = true
			game_started.emit()
			get_tree().call_group('obstacles', 'start_moving')
		
		set_raw_velocity(-jump_power)
		AudioManager.play_sfx('main', sfx_flap, true)

func handle_collision():
	if not alive: return
	
	game_over.emit()

func pass_collectible():
	if not alive: return
	
	AudioManager.play_sfx('vocals', sfx_munch)
	
	passed_collectible.emit()

func handle_game_over():
	alive = false
	
	AudioManager.play_sfx('main',sfx_death, true)
	if sfx_do_swear:
		AudioManager.play_sfx('vocals',sfx_swear, true)

func add_raw_velocity(delta): set_raw_velocity(raw_velocity + delta)

func set_raw_velocity(vel):
	raw_velocity = vel

func hide_shadow():
	shadow.visible = false
