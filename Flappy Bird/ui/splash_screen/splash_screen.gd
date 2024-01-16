class_name SplashScreen
extends Control

# --- References --- #
var game_scene: PackedScene = preload("res://scenes/game.tscn")

# --- Functions --- #
func load_game_scene():
	TransitionManager.load_scene(game_scene)
