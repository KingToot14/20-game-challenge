class_name HeightRandomizer
extends Node2D

# --- Variables --- #
@export_group("Height", 'height_')
@export var height_min := 40.0
@export var height_max := 140.0

# --- References --- #
@onready var parent: Node2D = $".."

# --- Functions --- #
func _ready():
	randomize_height()

func randomize_height():
	parent.position.y = randf_range(height_min, height_max)
