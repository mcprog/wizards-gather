class_name Player extends CharacterBody2D


@export_group("Nodes")
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var gravity_component: GravityComponent
@export var health_component: HealthComponent

signal player_died
signal game_paused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()
	health_component.prepare(Constants.PLAYER_BASE_HEALTH, Constants.PLAYER_BASE_ARMOR, Constants.PLAYER_BASE_REGEN)


func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	input_component.handle_input()
	movement_component.handle_movement(self)
	move_and_slide()
