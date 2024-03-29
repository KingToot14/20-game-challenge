class_name Obstacle
extends Node2D

# --- Signals --- #
signal collected()
signal object_reset()

# --- Variables --- #
@onready var collectible: Area2D = $"Collectible"

# --- Functions --- #
func _ready():
	var movement_controller := $"Simple Movement"
	movement_controller.add_to_group('obstacles')
	
	object_reset.connect(set_interactable.bind(true))
	collected.connect(set_interactable.bind(false))

func _process(delta):
	if position.x <= -20:
		object_reset.emit()

func _on_collectible_entered(body: Owl):
	collected.emit()
	body.pass_collectible()

func set_interactable(val: bool):
	collectible.visible = val
	collectible.monitoring = val
