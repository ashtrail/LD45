extends Node2D

var chainless_sprite = preload("res://entities/Gate/gate_chainless.png")
var open_sprite = preload("res://entities/Gate/gate-open.png")

var chainless = false
var opened = false

var narator

var last_text = ""

func _ready():
	narator = get_tree().get_nodes_in_group("narator")[0]
	$Door/CollisionShape2D.set_deferred("disabled", true)


func _process(_delta):
	if not chainless and Global.number_of_memory_found() >= 3:
		$GateSprite.texture = chainless_sprite
		chainless = true
		set_process(false)


func warn_player(text):
	if text == last_text and not $WarningDelay.is_stopped():
		return
	last_text = text
	narator._appendText(text)
	$WarningDelay.start()


func _on_Front_area_entered(area):
	print("front collision")
	if not chainless:
		print("not enough memories to open gate")
		warn_player("You need 3 memories to open the gate.")
	elif chainless and not opened:
		print("opening gate")
		warn_player("You can pass through the gate or gather more memories.")
		opened = true
		$GateSprite.texture = open_sprite
		$Door/CollisionShape2D.set_deferred("disabled", false)
	elif opened and Global.number_of_memory_found() < 7:
		print("gate opened but some memories not found")
		warn_player("You can pass through the gate or gather more memories.")
	elif opened and Global.number_of_memory_found() == 7:
		print("all memories found")
		warn_player("You have gathered all memories, pass through the gate.")


func _on_Door_area_entered(area):
	print("door collision, sending to end")
	get_tree().change_scene("res://levels/Epilogue.tscn")


func _on_Door_body_entered(body):
	print("door collision, sending to end")
	get_tree().change_scene("res://levels/Epilogue.tscn")
	pass # Replace with function body.


func _on_Front_body_entered(body):
	print("front collision")
	if not chainless:
		print("not enough memories to open gate")
		warn_player("You need 3 memories to open the gate.")
	elif chainless and not opened:
		print("opening gate")
		warn_player("You can pass through the gate or gather more memories.")
		opened = true
		$GateSprite.texture = open_sprite
		$Door/CollisionShape2D.set_deferred("disabled", false)
	elif opened and Global.number_of_memory_found() < 7:
		print("gate opened but some memories not found")
		warn_player("You can pass through the gate or gather more memories.")
	elif opened and Global.number_of_memory_found() == 7:
		print("all memories found")
		warn_player("You have gathered all memories, pass through the gate.")
	pass # Replace with function body.
