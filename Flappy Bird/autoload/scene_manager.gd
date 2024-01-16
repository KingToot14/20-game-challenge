extends Node

# --- Functions --- #
func _input(event):
	if event.is_action_pressed('quit_game'):
		quit_game()
	
	if event.is_action_pressed('restart_run'):
		TransitionManager.reload_scene()

func load_scene(scn: PackedScene):
	get_tree().change_scene_to_packed(scn)

func reload_scene():
	get_tree().reload_current_scene()

func quit_game():
	get_tree().quit()
