shader_type canvas_item;
uniform vec2 direction = vec2(1.0, 0.0);
uniform bool use_global_scroll = false;

uniform float scroll_speed = 0.1;
global uniform float ground_scroll_speed;

void fragment() {
	vec2 move = direction * TIME * scroll_speed;
	
	if (use_global_scroll) {
		move = direction * TIME * ground_scroll_speed;
	}
	COLOR = texture(TEXTURE, UV + move);
}
