class_name GameOverButton
extends Control

# --- Signals --- #
signal mouse_pressed()

# --- Variables --- #
@export_group("Colors", "color_")
@export var color_active: Color
@export var color_inactive: Color

# --- References --- #
@onready var text := $"Text" as Label
@onready var underline := $"Underline" as ColorRect

# --- Functions --- #
func _on_mouse_entered():
	underline.color = color_active
	text.add_theme_color_override('font_color', color_active)

func _on_mouse_exited():
	underline.color = color_inactive
	text.add_theme_color_override('font_color', color_inactive)

func _on_gui_input(event: InputEvent):
	if not event is InputEventMouseButton: return
	
	if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		mouse_pressed.emit()
