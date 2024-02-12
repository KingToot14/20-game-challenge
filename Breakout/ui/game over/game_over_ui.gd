class_name GameOverUI
extends Control

# --- Functions --- #
func _ready():
	set_visibility(false)

func restart_level():
	SceneManager.reload_root_scene()

func set_visibility(val: bool):
	visible = val

func handle_game_state_change(state):
	set_visibility(state == GameStateManager.GameState.GAME_OVER)
