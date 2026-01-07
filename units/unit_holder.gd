class_name UnitHolder extends Node2D


@export_subgroup("Settings")
@export var rotation_speed: float = 150.0

@export_subgroup("Nodes")
@export var player: Player
@export var spawn1: PackedScene
@export var spawn2: PackedScene
@export var spawn3: PackedScene
@export var spawn4: PackedScene

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var unit1
var unit2
var unit3
var unit4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rect = collision_shape_2d.shape.get_rect()
	if spawn1:
		var s = spawn1.instantiate()
		s.position = rect.position
		collision_shape_2d.add_child(s)
		unit1 = s
	if spawn2:
		var s = spawn2.instantiate()
		s.position = Vector2(rect.end.x, rect.position.y)
		collision_shape_2d.add_child(s)
		unit2 = s
	if spawn3:
		var s = spawn3.instantiate()
		s.position = Vector2(rect.position.x, rect.end.y)
		collision_shape_2d.add_child(s)
		unit3 = s
	if spawn4:
		var s = spawn4.instantiate()
		s.position = rect.end
		collision_shape_2d.add_child(s)
		unit4 = s
		


func _physics_process(delta: float) -> void:
	position = player.position
	rotation_degrees += rotation_speed * delta
