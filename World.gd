extends Node2D

#onready var vp = get_viewport()
onready var activeLevel = get_node("/root/World/SCREEN/block1") setget setLevel, getLevel

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func setLevel(lv):
	get_node("/root/World/SCREEN/").add_child(lv)
	activeLevel = lv

func getLevel():
	return activeLevel
