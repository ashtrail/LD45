extends Node2D

class_name BGMFadeLooper

export (AudioStreamOGGVorbis) var track_a
export (AudioStreamOGGVorbis) var track_b

export (float) var fadeout_a
export (float) var fadeout_b

var first_player_playing : bool


func _ready():
	$PlayerA.stream = track_a
	$FirstPlayerB.stream = track_b
	$SecondPlayerB.stream = track_b
	$FadeOutA.wait_time = fadeout_a
	$FadeOutB.wait_time = fadeout_b
	# Start first track A
	# print("starting Player A")
	$PlayerA.play()
	$FadeOutA.start()


func _on_FadeOutA_timeout():
	# print("A fade out, starting First Player B")
	$FirstPlayerB.play()
	$FadeOutB.start()
	first_player_playing = true


func _on_FadeOutB_timeout():
	if first_player_playing:
		# print("B fade out, starting Second Player")
		$SecondPlayerB.play()
		first_player_playing = false
	else:
		# print("B fade out, starting First Player")
		$FirstPlayerB.play()
		first_player_playing = true
	$FadeOutB.start()


# Be sure to prevent automatic looping

func _on_PlayerA_finished():
	# print("Player A finished, stopping it")
	$PlayerA.stop()

func _on_FirstPlayerB_finished():
	# print("First Player B finished, stopping it")
	$FirstPlayerB.stop()

func _on_SecondPlayerB_finished():
	# print("Second Player B finished, stopping it")
	$SecondPlayerB.stop()
