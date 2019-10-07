extends Node2D

func _ready():
	var location
	if Global.karma < 0:
		location = "Hell"
		$HellMusic.play()
	else:
		location = "Paradise"
		$ParadiseMusic.play()
	$Title.text = "After recovering his memories, Billy's soul finally left Purgatory and went to %s." % location

	var memories_found = Global.memories_found
	memories_found.sort()
	var memories_text = ""
	for i in range(7):
		var memory_index = i + 1
		if memories_found.find(memory_index) != -1:
			for line in Global.memories[memory_index].text:
				memories_text += line
			# memories_text += Global.memories[memory_index].text
		else:
			memories_text += "[...]"
		memories_text += "\n\n"

	$Memories.text = memories_text