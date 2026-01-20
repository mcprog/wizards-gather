
class_name SoundEffectComponent extends Node2D

@export_subgroup("Settings")
@export var volume_range = Vector2(1, 1)
@export var pitch_range = Vector2(1, 1)
@export var sound: AudioStream

@onready var sound_effect: AudioStreamPlayer2D = $SoundEffect


signal sound_finished
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sound_effect.stream = sound


func play() -> void:
	var volume_db = sound_effect.volume_db
	var pitch_scale = sound_effect.pitch_scale
	volume_db = randf_range(volume_range.x, volume_range.y)
	pitch_scale = randf_range(pitch_range.x, pitch_range.y)
	print_debug("play() random ranges setup in SoundEffectComponent")
	sound_effect.volume_db = volume_db
	sound_effect.pitch_scale = pitch_scale
	sound_effect.play(0)


func _on_sound_effect_finished() -> void:
	emit_signal("sound_finished")
