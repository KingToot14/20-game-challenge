extends Node

# --- Signals --- #
signal pause_state_changed(state: bool)

# --- Variables --- #
var paused: bool = false

# --- Functions --- #
func _input(event):
	pass

func set_pause_state(val: bool):
	paused = val
	pause_state_changed.emit(paused)

func toggle_pause_state():
	set_pause_state(not paused)
