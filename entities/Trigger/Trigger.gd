extends Node2D


export var TIME_TO_ACTIVATION: float = 3.0
export var DECREASE_SPEED: float = 0.1 # percent
var progression: float

var triggered: bool
var enlightened: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	triggered = false
	enlightened = false
	$Light2D.set_enabled(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if triggered || delta == 0: return
	
	if !enlightened:
		var tmp_progression = progression -  delta * DECREASE_SPEED
		progression = max(0, tmp_progression)
	else:
		progression +=  delta
		if progression > TIME_TO_ACTIVATION: 
			print("Triggered !")
			triggered = true


func _on_Area2D_area_entered(area):
	if !triggered && area.is_in_group("light_cone"):
		$Light2D.set_enabled(true)
		enlightened = true


func _on_Area2D_area_exited(area):
	if !triggered && area.is_in_group("light_cone"):
		$Light2D.set_enabled(false)
		enlightened = false
