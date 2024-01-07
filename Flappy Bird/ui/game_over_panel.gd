class_name GamveOverPanel
extends Control

# --- Variables --- #
@export var high_score_label: Label
@export var score_label: Label

@onready var new_label := $"Panel/High Score/New Indicator" as Label

@export_group("Animation", "anim_")
@export var anim_rotation_amp := 20.0
@export var anim_rotation_speed := 2.0

# --- Functions --- #
func _ready():
	update_score(0)
	
	set_visibility(false)

func _process(delta):
	new_label.rotation_degrees = anim_rotation_amp * sin(Time.get_unix_time_from_system() * anim_rotation_speed)

func update_score(value: int):
	score_label.text = str(value)

func update_high_score(value: int):
	high_score_label.text = str(value)

func set_visibility(val: bool):
	visible = val

func set_new_high_score():
	new_label.visible = true
