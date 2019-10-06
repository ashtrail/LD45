extends Node2D

var triggered: bool
export var SPEED: float = 100.0
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	triggered = false
	player = get_tree().get_nodes_in_group("player")[0]
	print(player.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!triggered): 
		return

	var direction = (player.position - position).normalized()
	var motion = direction * SPEED * delta
	position += motion

func _on_Area2D_area_entered(area):
	if area.is_in_group("light_area") || area.is_in_group("flash_light"):
		triggered = true


func _on_Area2D_area_exited(area):
	if area.is_in_group("light_area") || area.is_in_group("flash_light"):
		triggered = false
