class_name ScrollingCompoent extends Node2D

@export_subgroup("Settings")
@export var target: Node2D
@export var scroll_speed: float = -200.0

func _ready() -> void:
	assert(target)

func _process(delta: float) -> void:
	target.position.x += scroll_speed * delta
