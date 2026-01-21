class_name Game extends Node2D

@export_subgroup("Nodes")
@export var input_component: InputComponent
@export var unit_holder: UnitHolder

@export_subgroup("Settings")
@export var starter_units: Array[PackedScene]

@onready var wand_cursor: WandCursor = $WandCursor
@onready var enemy_obj: PackedScene = preload("res://enemies/example_enemy.tscn")

var enemy_list = []

func _ready() -> void:
	var starting_unit = starter_units[0].instantiate()
	
func _process(_delta) -> void:
	if enemy_list.size() < 1:
		var enemy: ExampleEnemy = enemy_obj.instantiate()
		enemy.position = Vector2(400, 400)
		self.add_child(enemy)
		enemy_list.append(enemy)
	
