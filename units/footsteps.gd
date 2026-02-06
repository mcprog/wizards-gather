class_name Footsteps extends Node2D

@export_subgroup("Settings")
@export var min_wait_time: float = 1.0
@export var max_wait_time: float = 2.0

var timer: float = 0.0
var valid: bool = false

@onready var sfx: SoundEffectComponent = $SoundEffectComponent

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not valid:
		return
		
	if timer <= 0:
		timer = randf_range(min_wait_time, max_wait_time)
		sfx.play()
	else:
		timer -= delta
