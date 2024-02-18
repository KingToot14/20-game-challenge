class_name TextButton
extends BaseButton

# --- Variables --- #
@export var text_label: Label
@export var underline_rect: ColorRect

@export var fill_rect: ColorRect

@export var tween_time: float = 0.0
# nuts
# huge nuts
var tween = null
var clr_suffix = ""


# --- References --- #
const THEME_COLOR_FILL = "fill_color_"
const THEME_COLOR_TEXT = "text_color_"

# --- Functions --- #
func _on_mouse_entered():
	clr_suffix = 'active'
	tween_button()

func _on_mouse_exited():
	clr_suffix = 'inactive'
	tween_button()

func tween_button():
	if tween:
		tween.kill()
	tween = create_tween().set_parallel(true)
	
	if fill_rect: tween_fill()
	if text_label: tween_text()
	if underline_rect: tween_underline()

#region tweening
func tween_fill():
	tween.tween_property(fill_rect, 'color', get_color(THEME_COLOR_FILL + clr_suffix), tween_time)

func tween_text():
	var text_clr = text_label.get_theme_color('font_color')
	tween.tween_method(set_text_color, text_clr, get_color(THEME_COLOR_TEXT + clr_suffix), tween_time)

func tween_underline():
	tween.tween_property(underline_rect, 'color', get_color(THEME_COLOR_TEXT + clr_suffix), tween_time)

func get_color(clr_name: String) -> Color:
	return ThemeDB.get_project_theme().get_color(clr_name, theme_type_variation)

func set_text_color(clr: Color):
	if text_label: text_label.add_theme_color_override('font_color', clr)
	if underline_rect: underline_rect.color = clr
#endregion
