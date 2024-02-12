class_name LifeManager
extends Node2D

# --- Signals --- #
signal life_changed(lf: int)

# --- Variables --- #
@export var base_lives: int = 3
var lives: int

# --- Functions --- #
func _ready():
	set_lives(base_lives)

func lose_life(delta: int = 1):
	set_lives(lives - delta)

func set_lives(lf: int):
	lives = lf
	life_changed.emit(lives)
