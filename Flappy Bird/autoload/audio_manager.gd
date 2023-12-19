extends AudioStreamPlayer

# --- Functions --- #
func play_sfx(sfx: AudioStream, override := false):
	if is_playing():
		if override:
			stop()
		else:
			return
	
	stream = sfx
	play()
