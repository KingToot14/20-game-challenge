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

var loading_scene := false
var load_path: String

var scn_curr_level = PackedScene
var curr_level_path: String

# --- References --- #
const PATH_LEVEL_ROOT = "levels/"

# --- Functions --- #
func _process(delta):
	if not loading_scene: return
	
	var status = ResourceLoader.load_threaded_get_status(load_path)
	
	print("Status: ", status)
	
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		loading_scene = false
		scn_curr_level = ResourceLoader.load_threaded_get(load_path)
		change_game_scene(GameScene.PLAY_AREA)

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

func load_level(path):
	load_path = PATH_LEVEL_ROOT + path + ".tscn"
	loading_scene = true
	
	var error = ResourceLoader.load_threaded_request(load_path)
	print("Error: ", error)

func instantiate_level():
	get_tree().current_scene.add_child(scn_curr_level.instantiate())

func reload_root_scene():
	get_tree().reload_current_scene()

func quit_game():
	get_tree().quit()
