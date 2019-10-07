extends KinematicBody2D

var mouse_position
var movement
var walking = false
var angle
var texture = load("res://entities/Player/billy_iddle.png")

func _ready():
	$Camera2D/Narator._appendText("Bonjour, ça va ? Moi non...\n J'ai mal a mon estime de moi...")
	Global.respawn_position = self.get_global_position()
	pass

func _process(delta):
	mouse_position = $FlashLight.get_local_mouse_position()
	
	$FlashLight.rotation += mouse_position.angle()*0.1
	angle = int(rad2deg($FlashLight.rotation)) % 360
	if (angle < -90 && angle > -270):
		$icon.flip_h = false
	else:
		$icon.flip_h = true
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
	if (movement.length() > 0 && !walking):
		walking = true
		$AnimationPlayer.play("Walking")
	if (movement.length() == 0 && walking):
		walking = false
		$AnimationPlayer.stop()
		$icon.texture = texture
	move_and_collide(movement * 2)
	pass


func _on_AreaTrigeredByEnemy_area_entered(area):
	if area.is_in_group("enemy"):
		$AudioStreamPlayer.play()
		$Death.play("DeathAnimation")
		yield($Death, "animation_finished")
		self.position = Global.respawn_position + Vector2(0, 200)
		$Death.play("FadeOut")
		print("Hit by an enemy")
	pass # Replace with function body.
