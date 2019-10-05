extends KinematicBody2D

var mouse_position
var movement

func _ready():
	pass

func _process(delta):
	mouse_position = get_local_mouse_position()
	rotation += mouse_position.angle()*0.1
	movement = Vector2(0, 0)
	if (Input.is_action_pressed("ui_up")):
		movement += Vector2(0, -1)
	if (Input.is_action_pressed("ui_down")):
		movement += Vector2(0, 1)
	if (Input.is_action_pressed("ui_right")):
		movement += Vector2(1, 0)
	if (Input.is_action_pressed("ui_left")):
		movement += Vector2(-1, 0)
	movement.normalized()
	move_and_collide(movement * 2)
	pass
