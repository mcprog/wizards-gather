class_name FlyingEyeEnemy extends CharacterBody2D


@export_subgroup("Components")
@export var animation_component: AnimationComponent
@export var attack_component: AttackComponent
@export var infobar_component: InfobarComponent
@export var bobbing_component: BobbingComponent

@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	animation_component.play_animation("fly")
	bobbing_component.prepare(self)


func _physics_process(delta: float) -> void:
	bobbing_component.handle_bobbing(self, delta)
	
	move_and_slide()
