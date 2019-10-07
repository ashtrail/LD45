extends RichTextLabel

var textIndex = 0
var timer = 0

var queue: Array = []
var current_text: String

# Called when the node enters the scene tree for the first time.
func _ready():
	current_text = "BEBE TES OU"
	bbcode_text = "[center]" + current_text
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if textIndex < current_text.length() && $Timer.is_stopped():
		timer += 1
		if timer % 10 == 0:
			bbcode_text += current_text[textIndex]
			textIndex += 1
		return
	
	if textIndex == current_text.length():
		if $Timer.is_stopped():
			$Timer.start()

	pass


func _appendText(var appened_text: String, var path_to_audio: String = ""):
	if current_text.empty():
		bbcode_text = "[center]"
		current_text = appened_text
	else:
		queue.append(appened_text)
	if !path_to_audio.empty():
		var sfx = load(path_to_audio) 
		sfx.set_loop(false)
		$GodSpeaker.stop()
		$GodSpeaker.set_stream(sfx)
		$GodSpeaker.play()
	


func _on_Timer_timeout():
	$Timer.stop()
	textIndex = 0
	if queue.size() > 0:
		current_text = queue.front()
		bbcode_text = "[center]"
		
		queue.pop_front()
	else:
		current_text = ""
		bbcode_text = "[center]"
		
	
