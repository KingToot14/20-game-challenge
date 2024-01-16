class_name MainMenu
extends Control

# --- Variables --- #
#balls :3
@export_group("Badges")
@export var badges: Array[Badge]

# --- Functions --- #
func update_badges(score: int):
	for badge in badges:
		badge.check_unlock_status(score)

func hide_menu():
	visible = false
