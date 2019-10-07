extends Node2D


export var TIME_TO_ACTIVATION: float = 3.0
export var DECREASE_SPEED: float = 0.1 # percent
var signal_to_emit: String
var progression: float

var triggered: bool
var enlightened: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	signal_to_emit = ""
	triggered = false
	enlightened = false
	$Light2D.set_enabled(false)

func set_signal_to_emit(name: String):
	signal_to_emit = name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if triggered || delta == 0: return
	
	if !enlightened:
		var tmp_progression = progression -  delta * DECREASE_SPEED
		progression = max(0, tmp_progression)
	else:
		progression +=  delta
		if progression > TIME_TO_ACTIVATION: 
			if signal_to_emit.length() != 0:
				get_parent().emit_signal(signal_to_emit)
			$Light2D/Area2D.add_to_group("light_area", true)
			triggered = true
			Global.respawn_position = self.get_global_position()


func _on_Area2D_area_entered(area):
	if !triggered && (area.is_in_group("light_area") || area.is_in_group("flash_light")):
		$Light2D.set_enabled(true)
		enlightened = true
		$AnimationPlayer.play("LightSwitchOn")


func _on_Area2D_area_exited(area):
	if !triggered && (area.is_in_group("light_area") || area.is_in_group("flash_light")):
		$Light2D.set_enabled(false)
		enlightened = false
		$AnimationPlayer.stop()
