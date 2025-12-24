class_name WandCursor extends Node2D

@export_subgroup("Nodes")
@export var vanish_component: VanishComponent

func start():
	vanish_component.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
