@tool
class_name RichTextVOff
extends RichTextEffect

# --- Identity --- #
var bbcode = "v_off"

# --- Effect --- #
func _process_custom_fx(char_fx):
	char_fx.offset.y = char_fx.env.get('px', 0)
	
	return true
