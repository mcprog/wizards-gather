class_name MainMenu extends Control

@onready var play_dark_button: TextureButton = $VBoxContainer/PlayDarkButton
@onready var quit_dark_button: TextureButton = $VBoxContainer/QuitDarkButton

const TO_GAME_SCENE = preload("res://ui/to_game.tscn")

func _on_play_dark_button_pressed() -> void:
	get_tree().change_scene_to_packed(TO_GAME_SCENE)


func _on_quit_dark_button_pressed() -> void:
	get_tree().quit()
