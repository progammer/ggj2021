extends KinematicBody2D
const SPEED = 500
var live_seconds = 1
var velocity
var angle

# Called when the node enters the scene tree for the first time.
func _ready():
	var origin = get_node("/root/World/PlayerShooter").global_position
	angle = get_angle_to(get_global_mouse_position())
	position = Vector2(0.9, 0.9) * origin + Vector2(0.1, 0.1) * get_global_mouse_position()
	rotate(angle)
	velocity = Vector2(SPEED, 0).rotated(angle)

func _physics_process(delta):
	live_seconds -= delta
	if live_seconds <= 0:
		queue_free()
	velocity = move_and_slide(velocity, Vector2.UP)
