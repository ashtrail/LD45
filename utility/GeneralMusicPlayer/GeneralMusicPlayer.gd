extends Node2D

var player: Node2D
export var forest_position: Vector2
export var cimetery_position: Vector2
export var plain_position: Vector2
export var decrease_speed_over_distance: float = 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	print(player.position)
	pass # Replace with function body.

func _distance_to_player(vector: Vector2):
	

	#print(vector.distance_to(player.position))
	return vector.distance_to(player.get_global_position())


func distance_to_forest():
	return _distance_to_player(forest_position)

func distance_to_cimetery():
	return _distance_to_player(cimetery_position)
	
func distance_to_plain():
	return _distance_to_player(plain_position)
	
func compute_volume_base_on_distance(distance: float):
	if distance < 8000: return 0
	return max(-80, -(distance - 8000) * decrease_speed_over_distance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Forest.set_volume_db(compute_volume_base_on_distance(distance_to_forest()))
	$Cimetery.set_volume_db(compute_volume_base_on_distance(distance_to_cimetery()))
	$Plain.set_volume_db(compute_volume_base_on_distance(distance_to_plain()))

