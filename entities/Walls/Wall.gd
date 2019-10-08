extends Node2D

export var initial_state: String = "closed" # "closed" or "opened"

var is_opened: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	if initial_state == "closed":
		close()
	elif initial_state == "opened":
		open()

func open():
	if is_opened: pass
	call_deferred("free")

	is_opened = true
	$StaticBody2D/CollisionShape2D.set_disabled(true)
	$Sprite.set_texture(load("res://entities/Door/opened_door.jpg"))

func close():
	if !is_opened: pass

	is_opened = false
	$StaticBody2D/CollisionShape2D.set_disabled(false)
	$Sprite.set_texture(load("res://entities/Door/closed_door.jpg"))

func _on_switch_signal():
	switch()

func switch():
	if is_opened: close()
	else: open()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
