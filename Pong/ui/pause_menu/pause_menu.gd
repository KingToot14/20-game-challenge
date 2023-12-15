class_name PauseMenu
extends Control

# --- Variables --- #
@onready var background = $"Background"
@onready var frame = $"Buttons"

var pauseable := false

# --- Functions --- #
func _ready():
	visible = true
	
	TimeScaleManager.time_scale_changed.connect(set_menu_visibility)
	set_menu_visibility()

func _input(event):
	if pauseable and event.is_action_pressed('toggle_pause'):
		TimeScaleManager.set_time_scale(1.0 if TimeScaleManager.paused else 0.0)

func set_pauseable():
	pauseable = true

func set_menu_visibility():
	background.visible = TimeScaleManager.paused
	frame.visible = TimeScaleManager.paused

func set_time_scale(val):
	TimeScaleManager.set_time_scale(val)
