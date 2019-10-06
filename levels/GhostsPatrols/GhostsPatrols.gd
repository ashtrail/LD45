extends PathFollow2D

export var SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !$Ghost.is_triggered():
		set_offset(get_offset() + SPEED*delta)
