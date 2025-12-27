class_name Game extends Node2D

@export_subgroup("Nodes")
@export var input_component: InputComponent
@export var unit_holder: UnitHolder

@export_subgroup("Settings")
@export var starter_units: Array[PackedScene]

@onready var wand_cursor: WandCursor = $WandCursor

func _ready() -> void:
	var starting_unit = starter_units[0].instantiate()
	
