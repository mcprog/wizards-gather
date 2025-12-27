class_name UnitHolder extends Node2D


@export_subgroup("Settings")
@export var rotation_speed: float = 150.0

@export_subgroup("Nodes")
@export var player: Player
@export var slots: Array[Area2D]

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var next_slot: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slots.resize(4)
	collision_shape_2d.shape.get_rect()

func add_unit(new_unit: Area2D) -> bool:
	if next_slot >= 4:
		return false
	slots[next_slot] = new_unit
	next_slot += 1
	return true

func _physics_process(delta: float) -> void:
	position = player.position
	rotation_degrees += rotation_speed * delta
