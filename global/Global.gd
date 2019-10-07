extends Node

var respawn_position: Vector2
var number_of_memory_found: int = 0

var ghost_sounds =  [
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-001.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-002.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-003.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-004.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-005.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-006.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-007.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-008.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-009.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-010.ogg"),
]
