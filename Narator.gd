extends RichTextLabel

var textIndex = 0
var timer = 0

var queue: Array = []
var current_text: String

# Called when the node enters the scene tree for the first time.
func _ready():
	current_text = "BEBE TES OU"
	bbcode_text = "[center]" + current_text
	visible_characters = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _appendText(var appened_text: String, var path_to_audio: String = ""):
	print(appened_text)

	queue.append(appened_text)
	if !path_to_audio.empty():
		var sfx = load(path_to_audio) 
		sfx.set_loop(false)
		$GodSpeaker.stop()
		$GodSpeaker.set_stream(sfx)
		$GodSpeaker.play()
	


func _on_TimerEraseText_timeout():
	$TimerEraseText.stop()
	visible_characters = 0
	if queue.size() > 0:
		current_text = queue.front()
		bbcode_text = "[center]"
		
		queue.pop_front()
	else:
		current_text = ""
		bbcode_text = "[center]"
		
	


func _on_TimerShowLetter_timeout():
	if current_text.empty():
		bbcode_text = ""
	else:
		bbcode_text = "[center]" + current_text

	if visible_characters == current_text.length():
		if $TimerEraseText.is_stopped():
			$TimerEraseText.start()
	elif !current_text.empty() && visible_characters < bbcode_text.length() && $TimerEraseText.is_stopped():
		visible_characters += 1
	else:
		visible_characters = 0

