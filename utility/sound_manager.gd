# autoload no class. This Sound Mananger is for sounds that need to persist beyond lifetime of "emitter"
extends Node2D

var sound_effects_muted: bool = false
var music_muted: bool = false

@onready var coin_pickup_sfx: SoundEffectComponent = $CoinPickupSfx

func play_coin_pickup():
	coin_pickup_sfx.play()

func set_music_mute(muted: bool):
	music_muted = muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), music_muted)

func toggle_mute_music():
	music_muted = not music_muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), music_muted)

func toggle_mute_sound_effects():
	sound_effects_muted = not sound_effects_muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Sound Effects"), sound_effects_muted)
