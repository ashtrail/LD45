extends Area2D

var index = 1

func _on_Area2D_area_entered(area):
	Global.add_memory(index)
	index += 1
	print("add one memory")


func _on_Area2D_body_entered(body):
	Global.add_memory(index)
	index += 1
	print("add one memory")
	pass # Replace with function body.
