extends Node2D

# --- Variables --- #
var audio_players = {}

# --- Enums --- #
enum Player {
	MAIN
}

# --- Functions --- #
func _ready():
	audio_players = {
		Player.MAIN: $"Main" as AudioStreamPlayer2D
	}

func play_sfx(key: Player, sfx: AudioStream, override := false):
	var player = audio_players[key]
	
	if player.is_playing():
		if override:
			player.stop()
		else:
			return
	
	player.stream = sfx
	player.play()
