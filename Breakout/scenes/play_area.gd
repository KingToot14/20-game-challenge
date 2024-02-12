class_name ClassNameHere
extends Node2D

# --- Variables --- #
@export var instantiate_level_on_ready := true

# --- Functions --- #
func _ready():
	if instantiate_level_on_ready:
		SceneManager.instantiate_level()
