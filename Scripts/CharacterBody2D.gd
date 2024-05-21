extends CharacterBody2D
var current_animation = "idle"
@export var speed =150
var angle = 0
func _physics_process(delta):
	current_animation = "idle"

	var mouse = get_local_mouse_position()
	angle = snappedf(mouse.angle(), PI/4) / (PI/4)
	angle = wrapi(int(angle), 0, 8)

	if Input.is_action_pressed("click") and mouse.length() > 10:
		current_animation = "run"
		velocity = mouse.normalized() * speed
		move_and_slide()
	$AnimatedSprite2D.animation = current_animation + str(angle)
