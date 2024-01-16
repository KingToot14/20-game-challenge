
extends Node2D

# --- Signals --- #
signal score_updated(sc: int)
signal high_score_updated(sc: int)
signal new_high_score_set()

# --- Variables --- #
var score: int = 0
var high_score: int = 0

# --- Functions --- #
func _ready():
	var file_manager := $"../File Manager" as FileManager
	if file_manager:
		set_high_score(file_manager.load_score_file())

func _input(event):
	if event.is_action_pressed('reset_score'):
		set_high_score(0)

func modify_score(delta: int):
	set_score(score + delta)

func set_score(val: int):
	score = val
	score_updated.emit(score)

func update_high_score():
	if score > high_score:
		set_high_score(score)
		new_high_score_set.emit()

func set_high_score(val: int):
	high_score = val
	high_score_updated.emit(high_score)
