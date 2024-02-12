class_name LevelSelectButton
extends Control

# --- Signals --- #
signal mouse_pressed()

# --- Variables --- #
@export var level_path: String

# --- References --- #
var tween = null

@onready var name_label := $"Name" as Label
@onready var fill_rect := $"Fill" as ColorRect

const THEME_COLOR_FILL = "fill_color_"
const THEME_COLOR_TEXT = "text_color_"

const TWEEN_DURRATION = 0.1

# --- Functions --- #
func _on_mouse_entered():
	set_color(true)

func _on_mouse_exited():
	set_color(false)

func set_color(active: bool):
	var suffix = 'active' if active else 'inactive'
	
	if tween:
		tween.kill()
	tween = create_tween()
	
	tween.tween_property(fill_rect, 'color', get_color(THEME_COLOR_FILL + suffix), TWEEN_DURRATION)
	tween.parallel().tween_method(set_name_color,
		name_label.get_theme_color('font_color'),
		get_color(THEME_COLOR_TEXT + suffix),
		TWEEN_DURRATION)

func set_name_color(clr: Color):
	name_label.add_theme_color_override('font_color', clr)

func get_color(clr_name: String) -> Color:
	return ThemeDB.get_project_theme().get_color(clr_name, theme_type_variation)

func _on_gui_input(event: InputEvent):
	if not (event is InputEventMouseButton): return
	
	if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		mouse_pressed.emit()

func load_level():
	SceneManager.load_level(level_path)
	
	# bslls cum penis cock dick
