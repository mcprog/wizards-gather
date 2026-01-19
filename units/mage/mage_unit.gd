class_name MageUnit extends Node2D


@export_subgroup("Components")
@export var animation_component: AnimationComponent
@export var damage_component: DamageComponent
@export var mana_component: ManaComponent

@onready var sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()
	damage_component.prepare(15.0, 0.01, 1.75)
	mana_component.prepare(30.0, 0.8, 1.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_rotation = 0.0
