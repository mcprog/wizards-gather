class_name ExampleEnemy extends Node2D


@export_subgroup("Nodes")
@onready var animation_component: AnimationComponent = $AnimationComponent
@onready var damage_component: DamageComponent = $DamageComponent
@onready var health_component: HealthComponent = $HealthComponent

@onready var sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()
	damage_component.prepare(8.0, 0.01, 1.75)
	health_component.prepare(80.0, 0.0, 0.33)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass
