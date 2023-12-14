class_name TitleManager
extends Node

# --- Signals --- #
signal game_started

# --- Variables --- #
var idle = true

# --- Functions --- #
func _input(event):
	if idle and event.is_action_pressed('start_game'):
		game_started.emit()
		
		idle = false
		self.visible = false
		
		# huge fucking balls
		# i lobe u
