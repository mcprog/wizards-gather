class_name FlyingEyeEnemy extends CharacterBody2D


@export_subgroup("Components")
@export var animation_component: AnimationComponent
@export var attack_component: AttackComponent
@export var health_component: HealthComponent
@export var infobar_component: InfobarComponent
@export var bobbing_component: BobbingComponent

@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	animation_component.play_animation("fly")
	attack_component.prepare(6.0, 0.01, 1.50, 18.0, 1.1, 3.0)
	health_component.prepare(50.0, 5.0, 0.15)
	infobar_component.prepare(attack_component, health_component)
	bobbing_component.prepare(self)


func _physics_process(delta: float) -> void:
	bobbing_component.handle_bobbing(self, delta)
	
	move_and_slide()
