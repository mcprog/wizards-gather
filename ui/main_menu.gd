class_name MainMenu extends Control

@onready var play_dark_button: TextureButton = $VBoxContainer/PlayDarkButton
@onready var quit_dark_button: TextureButton = $VBoxContainer/QuitDarkButton
@onready var sound_effect_component: SoundEffectComponent = $SoundEffectComponent

const TO_GAME_SCENE = preload("res://ui/to_game.tscn")

func _on_play_dark_button_button_up() -> void:
	get_tree().change_scene_to_packed(TO_GAME_SCENE)


func _on_quit_dark_button_button_up() -> void:
	get_tree().quit()


func _on_play_dark_button_button_down() -> void:
	sound_effect_component.play()

func _on_quit_dark_button_button_down() -> void:
	sound_effect_component.play()
