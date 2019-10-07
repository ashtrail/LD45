extends Node2D

signal pressed

export var text_to_trigger # string or array of strings
export var path_to_audio_speaker: String = ""
var narator

# Called when the node enters the scene tree for the first time.
func _ready():
	narator = get_tree().get_nodes_in_group("narator")[0]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		call_deferred("function_to_delay")
		emit_signal("pressed")
	pass # Replace with function body.

func function_to_delay():
		if path_to_audio_speaker.empty():
			if typeof(text_to_trigger) == TYPE_ARRAY:
				for line in text_to_trigger:
					narator._appendText(line.c_unescape())
			else:
				narator._appendText(text_to_trigger.c_unescape())
		else:
			narator._appendText(text_to_trigger.c_unescape(), path_to_audio_speaker)
		get_parent().remove_child(self)