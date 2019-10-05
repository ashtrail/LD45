extends KinematicBody2D

var mousePosition

func _ready():
	pass

func _process(delta):
	mousePosition = get_local_mouse_position()
	rotation += mousePosition.angle()*0.1
	pass
