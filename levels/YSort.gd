extends YSort

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal test_signal

# Called when the node enters the scene tree for the first time.
func _ready():
    $Trigger.set_signal_to_emit("test_signal")
   # $Door/Trigger.connect("test_signal", $Door, "_on_switch_signal")
