extends Area2D


onready var playerNode =  get_node("/root/World/Player")
onready var worldNode =  get_node("/root/World")
var b3 = preload("res://block4.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	visible=false
	set_process_input(false)

func activate():
	visible = true
	set_process_input(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pipie_area_entered(area):
	if area == playerNode:
		playerNode.spawn(get_viewport().size / 2 + Vector2(0, -30))
		worldNode.getLevel().queue_free()
		var newLevel = b3.instance()
		worldNode.setLevel(newLevel)
		get_node("/root/World/pipie4").activate()
		queue_free()
