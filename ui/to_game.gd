class_name ToGame extends Control
# Scene to transition to Game Scene that avoids cyclic scene preload dependencies

const GAME_SCENE_PATH = "res://scenes/game.tscn"

@export_subgroup("Settings")
@export var delay: float = 1.25

var timer

@onready var progress_bar: ProgressBar = $VBoxContainer/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = delay
	call_deferred("load_game_scene")

func load_game_scene():
	if timer > 0:
		return
	var error = get_tree().change_scene_to_file(GAME_SCENE_PATH)
	if error != OK:
		printerr("Failed to change scene to Game scene in to_game.gd")

func _process(delta: float) -> void:
	timer -= delta
	progress_bar.value = 100 * (delay - timer)
	if timer <= 0:
		load_game_scene()
