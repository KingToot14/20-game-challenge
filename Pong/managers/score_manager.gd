class_name ScoreManager
extends Node

# --- Variables --- #
var left_score: int = 0
var right_score: int = 0

var score_increment: int = 1

# --- References --- #
@export var game_ui: GameUI

# --- Functions --- #
func increment_score(side): modify_score(side, score_increment)

func modify_score(side, val):
	if side == -1:
		set_score(side, left_score + val)
	else:
		set_score(side, right_score + val)

func set_score(side, score):
	if side == -1:
		left_score = score
		game_ui.update_score(left_score, right_score)
	else:
		right_score = score
		game_ui.update_score(left_score, right_score)
