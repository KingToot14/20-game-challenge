extends Node

# --- Functions --- #
func has_collision_layer(body, layer):
	return body.get_collision_layer() >> (layer) & 1

func is_left_click(event: InputEvent) -> bool:
	if not (event is InputEventMouseButton): return false
	
	return event.button_index == MOUSE_BUTTON_LEFT and event.pressed
