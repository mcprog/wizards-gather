class_name MoveXComponent extends Node2D

@export_subgroup("Settings")
@export var speed: float = 100.0

func handle_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
	# no delta time since move_and_slide handles that
	body.velocity.x = direction * speed
