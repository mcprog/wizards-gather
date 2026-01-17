class_name DamageComponent extends Node2D

@export_subgroup("Stats", "dc")
@export var damage : float
## The crit chance of the unit. This should be a float on a scale from 0 - 1.
@export var crit_chance : float
@export var crit_damage : float

var rng = RandomNumberGenerator.new()

## Call this function to initialize all values
func prepare(dam: float, crit_c: float, crit_d: float) -> void:
	self.damage = dam
	self.crit_chance = crit_c
	self.crit_damage = crit_d

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

## Returns true at a rate scaling with the unit's crit chance
func roll_crit() -> bool:
	return rng.randf() < crit_chance
