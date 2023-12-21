class_name Danger
extends Area2D

# --- References --- #
var PLAYER_LAYER = 0b0000

# --- Functions --- #
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	if Util.has_collision_layer(body, PLAYER_LAYER):
		body.handle_collision()
