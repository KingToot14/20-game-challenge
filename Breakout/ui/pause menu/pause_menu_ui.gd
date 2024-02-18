class_name PauseMenuUI
extends CanvasLayer

# --- References --- #
@onready var background_rect = $"Background"

# --- Functions --- #
func _ready():
	PauseManager.pause_state_changed.connect(set_menu_visibility)
	set_menu_visibility(false)

func set_menu_visibility(val: bool):
	background_rect.visible = val

#region buttons 
func restart_level():
	SceneManager.reload_root_scene()

func exit_level():
	SceneManager.change_game_scene(SceneManager.GameScene.LEVEL_SELECT)

func quit_game():
	SceneManager.quit_game()
#endregion
