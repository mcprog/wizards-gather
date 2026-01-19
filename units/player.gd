class_name Player extends CharacterBody2D

@export_group("Components")
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var gravity_component: GravityComponent
@export var health_component: HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()
	health_component.prepare(Constants.PLAYER_BASE_HEALTH, Constants.PLAYER_BASE_ARMOR, Constants.PLAYER_BASE_REGEN)


func _physics_process(delta: float) -> void:
	print_debug(health_component.current_health)
	gravity_component.handle_gravity(self, delta)
	input_component.handle_input()
	# Overrites down jump input value if on bottom platform
	if position.y > Constants.BOTTOM_PLATFORM_PX:
		input_component.down_jump = false
	movement_component.handle_movement(self, input_component.direction_x, input_component.down_jump, input_component.jump)
	animation_component.handle_animation(input_component.direction_x, movement_component.is_jumping, is_on_floor())
	
	move_and_slide()
	
	if position.y > Constants.GAME_PX_HEIGHT + Constants.HALF_PX_PLAYER_HEIGHT:
		get_tree().change_scene_to_packed(Constants.DEATH_MENU)

	if input_component.debug:
		health_component.take_damage(self.position, 12.0, true, false)
