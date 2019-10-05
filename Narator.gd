extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var newText = ""
var textIndex = 0
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	bbcode_text = "BEBE TES OU"
	bbcode_text = "[center]" + bbcode_text
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if textIndex < newText.length():
		timer += 1
		if timer % 10 == 0:
			bbcode_text += newText[textIndex]
			textIndex += 1
	pass

func _appendText(var appenedText):
	newText = appenedText
	textIndex = 0
	bbcode_text = "[center]"
	pass