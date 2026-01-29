class_name MusicComponent extends Node

@export_subgroup("Settings")
@export var tracks: Array[AudioStream]
@export var volume: float = 1.0
@export var autoplay: bool = false

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var track_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(len(tracks) > 0)
	audio_stream_player.volume_db = volume
	if autoplay:
		play()

func play():
	audio_stream_player.stream = tracks[track_index]
	audio_stream_player.play()

func _on_audio_stream_player_finished() -> void:
	print_debug("Track finished")
	track_index += 1
	if track_index >= len(tracks):
		track_index = 0
	play()
