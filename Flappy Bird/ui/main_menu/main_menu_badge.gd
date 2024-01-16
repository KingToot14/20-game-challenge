class_name Badge
extends Control

# --- Variables --- #
@export var badge_rect: TextureRect
@export var required_score: int
@export var unlocked_texture: Texture2D

# --- Functions --- #
func check_unlock_status(score: int):
	if score < required_score: return
	
	badge_rect.texture = unlocked_texture
