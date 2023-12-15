extends Node

# --- Variables --- #
var window_scale: int = 4;
var max_scale: int = 1;

var match_proj_settings: bool = true;
var base_resolution: Vector2i;
var monitor_resolution: Vector2i;

# --- Functions --- #
func _ready() -> void:
	monitor_resolution = DisplayServer.screen_get_size();
	if match_proj_settings:
		base_resolution.x = ProjectSettings.get_setting("display/window/size/viewport_width")
		base_resolution.y = ProjectSettings.get_setting("display/window/size/viewport_height")
	
	var scales = monitor_resolution / base_resolution;
	
	max_scale = min(scales.x, scales.y);
	
	set_window_scale(window_scale);

func _input(event) -> void:
	if event.is_action_pressed("toggle_fullscreen"):
		toggle_fullscreen();
	elif not is_fullscreen():
		if event.is_action_pressed("decrease_resolution"):
			modify_window_scale(-1);
		elif event.is_action_pressed("increase_resolution"):
			modify_window_scale(1);

func modify_window_scale(delta: int) -> void: set_window_scale(window_scale + delta);

func set_window_scale(scale: int) -> void:
	window_scale = clamp(scale, 1, max_scale);
	var window = get_window();
	
	window.size = base_resolution * window_scale;
	window.position = (monitor_resolution / 2) - (window.size / 2);

func is_fullscreen() -> bool: return get_window().mode == Window.MODE_FULLSCREEN;

func toggle_fullscreen() -> void:
	var window = get_window();
	
	window.mode = Window.MODE_WINDOWED if is_fullscreen() else Window.MODE_FULLSCREEN;
