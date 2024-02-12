class_name LifeIndicator
extends Control

# --- Variables --- #
@export var life_rects: Array[TextureRect] = []

@export_group("Textures", "texture_")
@export var texture_full: Texture
@export var texture_empty: Texture

# --- References --- #
var max_lives: int

# --- Functions --- #
func _ready():
	max_lives = life_rects.size()
	
	update_lives(max_lives)

func update_lives(lives: int):
	for i in range(max_lives):
		life_rects[i].texture = texture_full if (max_lives - i - 1) < lives else texture_empty
