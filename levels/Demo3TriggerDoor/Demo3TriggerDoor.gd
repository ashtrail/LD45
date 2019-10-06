extends Node2D

# Factualy we could only use one signal for every trigger 
# We use several one for the purpose of a demo
# Signal link should be done using the UI
signal trigger1
signal trigger2
signal trigger3

var number_of_activated_trigger
# Called when the node enters the scene tree for the first time.
func _ready():
	number_of_activated_trigger = 0
	
	$Trigger1.set_signal_to_emit("trigger1")
	$Trigger2.set_signal_to_emit("trigger2")
	$Trigger3.set_signal_to_emit("trigger3")
	

func _on_trigger():
	print("triggered")
	number_of_activated_trigger += 1
	
	if number_of_activated_trigger ==3: $Door.switch()

