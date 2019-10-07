extends Node2D

var triggered: bool
export var SPEED: float = 100.0
var player

var nbr_light_area
var nbr_flash_light
# Called when the node enters the scene tree for the first time.
func _ready():
	triggered = false
	player = get_tree().get_nodes_in_group("player")[0]
	nbr_light_area = 0
	nbr_flash_light = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rand_range(0.0, 1.0) < 0.0005:
		var sfx = Global.ghost_sounds[randi() % Global.ghost_sounds.size()]
		$AudioStreamPlayer2D.stop()
		$AudioStreamPlayer2D.set_stream(sfx)
		$AudioStreamPlayer2D.play()
	if (!triggered): 
		return

	var direction = (player.get_global_position() - self.get_global_position()).normalized()
	var motion = direction * SPEED * delta
	position += motion
	



func _on_Area2D_area_entered(area):
	if area.is_in_group("light_area"): nbr_light_area += 1
	elif area.is_in_group("flash_light"): nbr_flash_light +=1
	if nbr_flash_light + nbr_light_area >= 1:
		triggered = true


func _on_Area2D_area_exited(area):
	if area.is_in_group("light_area"): nbr_light_area -= 1
	elif area.is_in_group("flash_light"): nbr_flash_light -=1
	if nbr_flash_light + nbr_light_area < 1:
		triggered = false
