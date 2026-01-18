class_name MovementComponent extends Node2D

@export_subgroup("Settings")
@export var speed: float = 100.0
@export var jump_velocity: float = -750.0

var is_jumping: bool = false

func handle_movement(body: CharacterBody2D) -> void:
	handle_horizontal_movement(body)
	handle_vertical_movement(body)

func handle_horizontal_movement(body: CharacterBody2D) -> void:
	var direction = 0.0
	if Input.is_action_pressed("left"):
		print_debug("Left was pressed")
		direction -= 2.0
	if Input.is_action_pressed("right"):
		print_debug("Right was pressed")
		direction += 2.0
	# no delta time since move_and_slide handles that
	body.velocity.x = direction * speed

func handle_vertical_movement(body: CharacterBody2D) -> void:
	if body.is_on_floor():
		if Input.is_action_pressed("down"):
			# Hack the position below the platform
			body.position.y += 1
		if Input.is_action_pressed("jump"):
			body.velocity.y = jump_velocity
	is_jumping = body.velocity.y < 0 and not body.is_on_floor()
	
