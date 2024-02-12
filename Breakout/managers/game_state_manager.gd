class_name GameStateManager
extends Node2D

# --- Signals --- #
signal state_changed(new: GameState)

# --- Enums --- #
enum GameState {
	PLAYING,
	PAUSED,
	GAME_OVER
}

# --- Variables --- #
var game_state := GameState.PLAYING

# --- Functions --- #
func _ready():
	set_state(GameState.PLAYING)

func set_state(state: GameState):
	game_state = state
	state_changed.emit(state)
