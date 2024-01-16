class_name FileManager
extends Node2D

# --- References --- #
var PATH_SCORE := "user://high.score"

# --- Functions --- #
func load_score_file():
	var file = FileAccess.open(PATH_SCORE, FileAccess.READ)
	
	if not file:
		save_score_file(0)
		file = FileAccess.open(PATH_SCORE, FileAccess.READ)
	
	return int(file.get_as_text())

func save_score_file(score):
	var file = FileAccess.open(PATH_SCORE, FileAccess.WRITE)	
	file.store_string(str(score))
