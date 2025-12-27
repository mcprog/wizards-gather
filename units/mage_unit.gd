class_name MageUnit extends Node2D


@export_subgroup("Nodes")
@export var animation_component: AnimationComponent
@export var statistics: UnitStatistics

@onready var sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()
	statistics.prepare(150.0, 15.0, 0.01, 1.75, 20.0, 1.33, 33)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass
