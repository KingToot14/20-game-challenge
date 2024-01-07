class_name UIManager
extends Control

# --- Variables --- #
@export var high_score_label: Label
@export var score_label: Label

# --- Functions --- #
func _ready():
	update_score(0)

func update_score(score: int):
	score_label.text = str(score)

func update_high_score(score: int):
	high_score_label.text = str(score)
	
