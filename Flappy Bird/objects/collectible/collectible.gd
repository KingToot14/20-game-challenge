class_name Collectible
extends Area2D

# --- Signals --- #
signal collected()

# --- Variables --- #
var interactable := true

# --- References --- #
@onready var sprite = $"Sprite"

var PLAYER_LAYER = 0b0000

# --- Functions --- #
func _ready():
	collected.connect(set_interactable.bind(false))

func _on_body_entered(body: Node2D):
	if Util.has_collision_layer(body, PLAYER_LAYER):
		collected.emit()

func set_interactable(val):
	interactable = val
	sprite.visible = val
