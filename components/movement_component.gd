class_name MovementComponent extends Node2D


@export_subgroup("Settings")
@export var speed: float = 200.0
@export var jump_velocity: float = -750.0

var is_jumping: bool = false

func handle_movement(body: CharacterBody2D, direction_x: float, down_jump: bool, jump: bool) -> void:
	handle_horizontal_movement(body, direction_x)
	handle_vertical_movement(body, down_jump, jump)

func handle_horizontal_movement(body: CharacterBody2D, direction_x: float) -> void:
	# no delta time since move_and_slide handles that
	body.velocity.x = direction_x * speed

func handle_vertical_movement(body: CharacterBody2D, down_jump: bool, jump: bool) -> void:
	if body.is_on_floor():
		if down_jump:
			# Hack the position below the platform
			body.position.y += 1
		if jump:
			body.velocity.y = jump_velocity
	is_jumping = body.velocity.y < 0 and not body.is_on_floor()
	
