extends Node2D

var triggered: bool
var nbr_light_area
var nbr_flash_light
var normalGhost = load("res://entities/WhiteGhost/white_ghost.png")
var closedEyesGhost = load("res://entities/WhiteGhost/white_ghost_eyes_closed.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	triggered = false
	nbr_light_area = 0
	nbr_flash_light = 0

func is_triggered():
	return triggered

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Area2D_area_entered(area):
	if area.is_in_group("light_area"): nbr_light_area += 1
	elif area.is_in_group("flash_light"): nbr_flash_light +=1
	if nbr_flash_light + nbr_light_area >= 1:
		$Sprite.texture = closedEyesGhost
		triggered = true


func _on_Area2D_area_exited(area):
	if area.is_in_group("light_area"): nbr_light_area -= 1
	elif area.is_in_group("flash_light"): nbr_flash_light -=1
	if nbr_flash_light + nbr_light_area < 1:
		$Sprite.texture = normalGhost
		triggered = false

func _on_TimerSound_timeout():
	if rand_range(0.0, 1.0) < 0.1:
		var sfx = Global.ghost_sounds[randi() % Global.ghost_sounds.size()]
		$AudioStreamPlayer2D.stop()
		$AudioStreamPlayer2D.set_stream(sfx)
		$AudioStreamPlayer2D.play()
