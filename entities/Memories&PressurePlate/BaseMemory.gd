extends Node2D

# export var text_to_trigger = ""
export var path_to_audio_speaker = ""
export var memory_index : int

# Called when the node enters the scene tree for the first time.
func _ready():
	$PressurePlate.text_to_trigger = Global.get_memory_text(memory_index)
	$PressurePlate.path_to_audio_speaker = path_to_audio_speaker
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PressurePlate_pressed():
	$Memory.stop_light()
	$Memory.stop_particles()
	Global.add_memory(memory_index)
