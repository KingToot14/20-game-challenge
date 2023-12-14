class_name GameUI
extends Control

# --- Variables --- #
@export var left_score_single: Label
@export var left_score_double: Array[Label]
@export var right_score_single: Label
@export var right_score_double: Array[Label]

@export var left_score_effect: EffectLine
@export var right_score_effect: EffectLine

# --- References --- #
func _ready():
	update_score(0, 0)

func update_score(left, right):
	if left > 9:
		left_score_single.hide()
		left_score_double[0].show()
		left_score_double[1].show()
		
		left_score_double[0].text = str(left / 10)
		left_score_double[1].text = str(left % 10)
	else:
		left_score_single.show()
		left_score_double[0].hide()
		left_score_double[1].hide()
		
		left_score_single.text = str(left)
	
	if right > 9:
		right_score_single.hide()
		right_score_double[0].show()
		right_score_double[1].show()
		
		right_score_double[0].text = str(right / 10)
		right_score_double[1].text = str(right % 10)
	else:
		right_score_single.show()
		right_score_double[0].hide()
		right_score_double[1].hide()
		
		right_score_single.text = str(right)

func play_score_effect(side):
	if side == 1:
		left_score_effect.play_anim()
	else:
		right_score_effect.play_anim()
