extends Node

# --- Signals --- #
signal time_scale_changed()

# --- Variables --- #
var paused: bool = false
var time_scale: float = 1.0

# --- Functions --- #
func set_time_scale(val):
	paused = val == 0
	time_scale = val
	
	time_scale_changed.emit()
