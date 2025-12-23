class_name UnitStatistics extends Node2D

@export var current_health : float
@export var max_health : float
@export var damage : float
## The crit chance of the unit. This should be a float on a scale from 0 - 100.
@export var crit_chance : float
@export var crit_damage : float
@export var armor : float
@export var health_regen : float
@export var movespeed : float

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	processHealthRegen(delta)
	pass

func processHealthRegen(delta: float) -> void:
	if current_health < max_health:
		var healPerFrame = health_regen * delta
		if (current_health + healPerFrame >= max_health):
			current_health = max_health
		else:
			current_health += healPerFrame

func rollCrit() -> bool:
	return rng.randf() < crit_chance
