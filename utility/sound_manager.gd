# autoload no class. This Sound Mananger is for sounds that need to persist beyond lifetime of "emitter"
extends Node2D

var sound_effects_muted: bool = false
var music_muted: bool = false

var config := ConfigFile.new()
var save_path := "user://settings.cfg"

@onready var coin_pickup_sfx: SoundEffectComponent = $CoinPickupSfx

func save_settings():
	config.set_value("Audio", "sfx", sound_effects_muted)
	config.set_value("Audio", "music", music_muted)
	
	var error = config.save(save_path)
	if error != OK:
		print_debug("Error occured in save_settings: ", error)
	else:
		print_debug("saved config file")

func load_settings():
	var error = config.load(save_path)
	
	if error == OK:
		music_muted = config.get_value("Audio", "music", false)
		set_music_mute(music_muted)
		sound_effects_muted = config.get_value("Audio", "sfx", false)
		set_sound_effects_mute(sound_effects_muted)
	else:
		print_debug("No settings file found or error: " , error)
		save_settings()

func play_coin_pickup():
	coin_pickup_sfx.play()

func set_music_mute(muted: bool):
	music_muted = muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), music_muted)

func set_sound_effects_mute(muted: bool):
	sound_effects_muted = muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Sound Effects"), sound_effects_muted)

func toggle_mute_music():
	music_muted = not music_muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), music_muted)

func toggle_mute_sound_effects():
	sound_effects_muted = not sound_effects_muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Sound Effects"), sound_effects_muted)
