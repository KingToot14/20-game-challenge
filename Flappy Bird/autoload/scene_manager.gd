extends Node

# --- Functions --- #
func _input(event):
	if event.is_action_pressed('quit_game'):
		quit_game()
	
	if event.is_action_pressed('restart_run'):
		reload_scene()

func reload_scene():
	get_tree().reload_current_scene()

func quit_game():
	get_tree().quit()
