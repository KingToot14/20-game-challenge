class_name EffectLine
extends ColorRect

# --- Variables --- #
@export var tween_time: float

var start_x: int
@export var end_x: int
var base_color: Color

var tween = create_tween()

# --- Functions --- #
func _ready():
	start_x = position.x
	base_color = color

func play_anim():
	position.x = start_x
	color = base_color
	
	if tween:
		tween.kill()
	
	tween = create_tween()
	
	tween.set_parallel(true)
	
	tween.tween_property(self, 'position:x', end_x, tween_time).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, 'color:a', 0, tween_time).set_ease(Tween.EASE_OUT)
