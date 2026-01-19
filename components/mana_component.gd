class_name ManaComponent extends Node2D


@export_subgroup("Stats", "mc")
@export var current_mana : float
@export var max_mana : float
## The attack speed, represented as attacks/second.
## Example: 0.5 attack speed => 2 seconds per attack
@export var attack_speed : float
@export var mana_regen : float

var is_max_mana: bool = false


## Call this function to initialize all values
func prepare(max_mana: float, attacks_per_second: float, mana_per_second: float) -> void:
	self.max_mana = max_mana
	self.current_mana = max_mana
	self.attack_speed = attacks_per_second
	self.mana_regen = mana_per_second

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	process_mana_regen(delta)

## Handles mana regeneration per tick
func process_mana_regen(delta: float) -> void:
	if current_mana < max_mana:
		# Multiply by delta to handle Mana/s
		var mana_per_frame = mana_regen * delta
		if (current_mana + mana_per_frame >= max_mana):
			current_mana = max_mana
			is_max_mana = true
		else:
			current_mana += mana_per_frame

## Use this function inside any timer.start(*) calls
func get_attack_speed_as_duration() -> float:
	return 1.0 / attack_speed

func reset_manabar() -> void:
	current_mana = 0
