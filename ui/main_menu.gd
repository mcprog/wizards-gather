class_name MainMenu extends Control

@onready var play_dark_button: TextureButton = $VBoxContainer/PlayDarkButton
@onready var quit_dark_button: TextureButton = $VBoxContainer/QuitDarkButton
@onready var sound_effect_component: SoundEffectComponent = $SoundEffectComponent
@onready var music_component: MusicComponent = $MusicComponent
@onready var mute_music_button: TextureButton = $MuteMusicButton
@onready var mute_sound_effects_button: TextureButton = $MuteSoundEffectsButton

const TO_GAME_SCENE = preload("res://ui/to_game.tscn")

func _ready() -> void:
	#mute_music_button.button_pressed = SoundManager.music_muted
	SoundManager.load_settings()
	mute_music_button.set_pressed_no_signal(SoundManager.music_muted)
	mute_sound_effects_button.set_pressed_no_signal(SoundManager.sound_effects_muted)
	music_component.play()

func _on_play_dark_button_button_up() -> void:
	get_tree().change_scene_to_packed(TO_GAME_SCENE)


func _on_quit_dark_button_button_up() -> void:
	SoundManager.save_settings()
	get_tree().quit()


func _on_play_dark_button_button_down() -> void:
	sound_effect_component.play()

func _on_quit_dark_button_button_down() -> void:
	sound_effect_component.play()


func _on_mute_music_button_toggled(_toggled_on: bool) -> void:
	sound_effect_component.play()
	SoundManager.toggle_mute_music()


func _on_mute_sound_effects_button_toggled(_toggled_on: bool) -> void:
	SoundManager.toggle_mute_sound_effects()
	
