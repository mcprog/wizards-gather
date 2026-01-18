class_name Player extends CharacterBody2D

@export_group("Nodes")
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var gravity_component: GravityComponent
@export var health_component: HealthComponent

# May not need
signal player_died
signal game_paused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()
	health_component.prepare(Constants.PLAYER_BASE_HEALTH, Constants.PLAYER_BASE_ARMOR, Constants.PLAYER_BASE_REGEN)


func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	input_component.handle_input()
	movement_component.handle_movement(self, input_component.direction_x, input_component.down_jump, input_component.jump)
	move_and_slide()
	
	if position.y > Constants.GAME_PX_HEIGHT + Constants.HALF_PX_PLAYER_HEIGHT:
		get_tree().change_scene_to_packed(Constants.DEATH_MENU)
