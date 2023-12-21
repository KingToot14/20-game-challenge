class_name ScoreManager
extends Node2D

# --- Signals --- #
signal score_updated(sc: int)

# --- Variables --- #
var score: int = 0

# --- Functions --- #
func _ready():
	pass

func modify_score(delta: int):
	set_score(score + delta)

func set_score(val: int):
	score = val
	score_updated.emit(score)
