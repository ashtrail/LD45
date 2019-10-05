extends Node2D

var triggered: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	triggered = false

func is_triggered():
	return triggered

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_area_entered(area):
	if area.is_in_group("light_cone"):
		triggered = true


func _on_Area2D_area_exited(area):
	if area.is_in_group("light_cone"):
		triggered = false