extends Node2D

var paths = []
export var SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	for node1 in get_children():
		if node1 is Path2D:
			for node2 in node1.get_children():
				if node2 is PathFollow2D:
					paths.append(node2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for path in paths:
		var ghost = path.get_children()[0]
		if !ghost.is_triggered():
			path.set_offset(path.get_offset() + SPEED*delta)
