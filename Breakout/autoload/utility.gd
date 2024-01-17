extends Node

# --- Functions --- #
func has_collision_layer(body, layer):
	return body.get_collision_layer() >> (layer) & 1
