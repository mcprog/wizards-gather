class_name VanishComponent extends Node2D

@export_subgroup("Settings")
@export var lifetime = 1.5

var timer = 0.0


func start():
	timer = lifetime
	get_parent().show()

func _process(delta: float) -> void:
	if timer > 0:
		timer -= delta
	else:
		get_parent().hide()
