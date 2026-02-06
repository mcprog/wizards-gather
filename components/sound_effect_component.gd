
class_name SoundEffectComponent extends Node2D

@export_subgroup("Settings")
@export var volume_range = Vector2(1, 1)
@export var pitch_range = Vector2(1, 1)
@export var sounds: Array[AudioStream]

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

signal sound_finished

func choose_random_sound():
	audio_stream_player.stream = sounds.pick_random()

func play() -> void:
	choose_random_sound()
	var volume_db = audio_stream_player.volume_db
	var pitch_scale = audio_stream_player.pitch_scale
	volume_db = randf_range(volume_range.x, volume_range.y)
	pitch_scale = randf_range(pitch_range.x, pitch_range.y)
	audio_stream_player.volume_db = volume_db
	audio_stream_player.pitch_scale = pitch_scale
	audio_stream_player.play()

func _on_sound_effect_finished() -> void:
	emit_signal("sound_finished")
