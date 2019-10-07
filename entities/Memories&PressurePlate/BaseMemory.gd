extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var text_to_trigger = ""
export var path_to_audio_speaker = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$PressurePlate.text_to_trigger = text_to_trigger
	$PressurePlate.path_to_audio_speaker = path_to_audio_speaker
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PressurePlate_pressed():
	$Memory.stop_light()
	$Memory.stop_particles()
	Global.number_of_memory_found += 1