class_name UIManager
extends Control

# --- Variables --- #
@export var highscore_label: Label
@export var score_label: Label

# --- Functions --- #
func _ready():
	update_score(0)

func update_score(score: int):
	score_label.text = str(score)
