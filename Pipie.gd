extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playerNode =  get_node("/root/World/Player")
onready var worldNode =  get_node("/root/World")
var b2 = preload("res://block2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pipie_area_entered(area):
	if area == playerNode:
		playerNode.spawn(get_viewport().size / 2)
		worldNode.getLevel().queue_free()
		var newLv = b2.instance()
		worldNode.setLevel(newLv)
		get_node("/root/World/pipie2").activate()
		queue_free()
