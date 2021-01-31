extends AnimatedSprite

func _ready():
	play()

func _on_intro_animation_finished():
	get_node("/root/World/Player").spawn(get_viewport().size / 2) 
	queue_free()
