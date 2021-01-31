extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const spd = 300
var velocity = Vector2()
var on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
func show():
	visible = true
	on = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if on:
		velocity.x = spd * (Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right"))
		velocity.y = spd * (Input.get_action_strength("ui_down") + Input.get_action_strength("ui_up"))
		var angle = (get_global_mouse_position() - get_global_transform().origin).angle_to(Vector2.UP)
		rotate(get_angle_to(get_global_mouse_position()))
		velocity = move_and_slide(velocity)
		if Input.is_action_just_pressed("shoot"):
			shoot()

func shoot():
	var projectile = load("res://Bullet.tscn")
	var bullet = projectile.instance()
	get_node("/root/World").add_child(bullet)
