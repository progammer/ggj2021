extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# for boss fight
var isVsFinal = false

onready var vp = get_viewport()

# Called when the node enters the scene tree for the first time.
func spawn(newloc):
	vp.warp_mouse(newloc) #(vp.size / 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position = get_global_mouse_position()

#WHY DOESNT THIS WORK D: oh well it's likely to be jank anyways
#func _on_SCREEN_mouse_exited():
#	print("exited")

#alt sol
func _on_SCREEN_area_entered(area):
	if area == self:
		z_index = 0

func _on_SCREEN_area_exited(area):
	if area == self:
		z_index = -1

