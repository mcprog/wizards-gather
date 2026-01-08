class_name ToGame extends Control
# Scene to transition to Game Scene that avoids cyclic scene preload dependencies

const GAME_SCENE_PATH = "res://scenes/game.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("load_game_scene")

func load_game_scene():
	var error = get_tree().change_scene_to_file(GAME_SCENE_PATH)
	if error != OK:
		printerr("Failed to change scene to Game scene in to_game.gd")
