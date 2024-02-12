class_name HealthSystem
extends Node2D

# --- Signals --- #
signal took_damage(int)
signal died()

# --- Variables --- #
@export var base_health: int = 1
var health: int

# --- Functions --- #
func _ready():
	set_health(base_health)

func take_damage(dmg: int = 1):
	set_health(max(health - dmg, 0))
	
	if health == 0:
		died.emit()

func set_health(hp: int):
	health = hp
	took_damage.emit(health)
