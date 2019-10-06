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
	if (!triggered): 
		return

	var direction = (player.position - position).normalized()
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
