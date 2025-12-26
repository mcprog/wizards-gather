class_name Player extends CharacterBody2D


@export_group("Nodes")
@export var input_component: InputComponent
@export var move_x_component: MoveXComponent
@export var animation_component: AnimationComponent
@export var gravity_component: GravityComponent
@export var jump_component: JumpComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()


func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	input_component.handle_input()
	jump_component.handle_jump(self, input_component.clicked)
	
	move_and_slide()
