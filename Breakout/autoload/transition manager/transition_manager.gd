extends CanvasLayer

# --- Variables --- #
@onready var animator := $"Animator" as AnimationPlayer

# --- References --- #
var ANIM_CLOUDS_IN := "clouds_in"
var ANIM_CLOUDS_OUT := "clouds_out"

# --- Functions --- #
func reload_scene():
	animator.play(ANIM_CLOUDS_IN)
	await animator.animation_finished
	SceneManager.reload_scene()
	animator.play(ANIM_CLOUDS_OUT)

func load_scene(path: String):
	animator.play(ANIM_CLOUDS_IN)
	await animator.animation_finished
	SceneManager.load_scene(path)
	animator.play(ANIM_CLOUDS_OUT)
