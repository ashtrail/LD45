extends KinematicBody2D

var mouse_position
var movement

func _ready():
	$Camera2D/Narator._appendText("Bonjour, ça va ? Moi non...\n J'ai mal a mon estime de moi...")
	pass

func _process(delta):
	mouse_position = $FlashLight.get_local_mouse_position()
	$FlashLight.rotation += mouse_position.angle()*0.1
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
	move_and_collide(movement * 9)
	pass
