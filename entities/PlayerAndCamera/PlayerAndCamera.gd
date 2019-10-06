extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_position
var movement

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	mouse_position = $Player/FlashLight.get_local_mouse_position()
	$Player/FlashLight.rotation += mouse_position.angle()*0.1
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
	$Player.move_and_collide(movement * 2)
	pass