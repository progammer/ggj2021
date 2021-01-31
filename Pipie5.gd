extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playerNode =  get_node("/root/World/Player")
onready var worldNode =  get_node("/root/World")
onready var virusNode = get_node("/root/World/Virus")
onready var textBox = get_node("/root/World/TextEdit")
onready var ascendedPlayer = get_node("/root/World/PlayerShooter")

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
		playerNode.spawn(get_viewport().size / 4)
		worldNode.getLevel().queue_free()
		#next is boss
		textBox.text = "ascension unlocked! LMB to shoot!"
		playerNode.queue_free()
		ascendedPlayer.show()
		virusNode.show()
		queue_free()
