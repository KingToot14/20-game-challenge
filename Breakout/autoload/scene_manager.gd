extends Node

# --- Functions --- #
func _input(event):
	pass

func load_scene(scn: PackedScene):
	get_tree().change_scene_to_packed(scn)

func reload_scene():
	get_tree().reload_current_scene()

func quit_game():
	get_tree().quit()
