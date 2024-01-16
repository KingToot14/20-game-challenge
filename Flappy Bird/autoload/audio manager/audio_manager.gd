extends Node2D

# --- Variables --- #
var audio_players = {}

# --- Functions --- #
func _ready():
	audio_players = {
		'main': $"Main" as AudioStreamPlayer2D,
		'vocals': $"Vocals" as AudioStreamPlayer2D
	}

func play_sfx(key: String, sfx: AudioStream, override := false):
	var player = audio_players[key]
	
	if player.is_playing():
		if override:
			player.stop()
		else:
			return
	
	player.stream = sfx
	player.play()
