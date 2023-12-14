class_name PauseButton
extends Control

# --- Signals --- #
signal control_pressed

# --- Variables --- #
@onready var label: Label = $"Option Name"

@export var default_color: Color
@export var hover_color: Color

var tween = null

# --- Functions --- #
func _on_mouse_entered():
	label.add_theme_color_override('font_color', hover_color)
	
	if tween:
		tween.kill()
	tween = create_tween()
	
	tween.tween_property(label, 'position:x', 4, 0.1)

func _on_mouse_exited():
	label.add_theme_color_override('font_color', default_color)
	
	if tween:
		tween.kill()
	tween = create_tween()
	
	tween.tween_property(label, 'position:x', 0, 0.1)

func _on_gui_input(event):
	if not (event is InputEventMouseButton):
		return
	
	if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		control_pressed.emit()

# --- Button Opetions --- #
func unpause_game():
	TimeScaleManager.set_time_scale(1.0)

func reload_scene():
	unpause_game()
	SceneManager.reload_scene()

func quit_game():
	SceneManager.quit_game()
