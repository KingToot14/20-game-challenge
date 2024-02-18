extends Node

# --- Enums --- #
enum GameScene {
	MAIN_MENU,
	LEVEL_SELECT,
	PLAY_AREA
}

# --- Variables --- #
var scn_main_menu = preload("res://scenes/main menu/main_menu.tscn")
var scn_level_select = preload("res://scenes/level select/level_select.tscn")
var scn_play_area = preload("res://scenes/play_area.tscn")

var load_path: String

var scn_curr_level: PackedScene

# --- References --- #
const PATH_LEVEL_ROOT = "levels/"

# --- Functions --- #
func change_game_scene(scn: GameScene):
	match scn:
		GameScene.MAIN_MENU:
			change_root_scene(scn_main_menu)
		GameScene.LEVEL_SELECT:
			change_root_scene(scn_level_select)
		GameScene.PLAY_AREA:
			change_root_scene(scn_play_area)

func change_root_scene(scn: PackedScene):
	get_tree().change_scene_to_packed(scn)

func load_level(path: String):
	AsyncLoader.new(PATH_LEVEL_ROOT + path + ".tscn", done_loading_level)

func done_loading_level(scn: PackedScene):
	scn_curr_level = scn
	
	change_game_scene(GameScene.PLAY_AREA)

func instantiate_level():
	if scn_curr_level:
		add_scene(scn_curr_level)
		# hehe nutd

func add_scene(scn: PackedScene):
	get_tree().current_scene.add_child(scn.instantiate())

func load_scene(path: String, callback: Callable = change_root_scene):
	AsyncLoader.new(path, callback)

func reload_root_scene():
	get_tree().reload_current_scene()

func quit_game():
	get_tree().quit()
