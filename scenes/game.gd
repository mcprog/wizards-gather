class_name Game extends Node2D

@export_subgroup("Nodes")
@export var input_component: InputComponent

@onready var wand_cursor: WandCursor = $WandCursor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	input_component.handle_input()
	input_component.spawn_cursor(wand_cursor)
