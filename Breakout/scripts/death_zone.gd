class_name DeathZone
extends Area2D

# --- Functions --- #
func _on_body_entered(body: Node2D):
	body.handle_collision(Pickaxe.CollisionSource.DEATH_ZONE)
