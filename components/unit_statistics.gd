class_name UnitStatistics extends Node2D

@export_subgroup("Stats")
@export var current_health : float
@export var max_health : float
@export var damage : float
## The crit chance of the unit. This should be a float on a scale from 0 - 1.
@export var crit_chance : float
@export var crit_damage : float
@export var armor : float
@export var health_regen : float
@export var movespeed : float

var rng = RandomNumberGenerator.new()

## Call this function to initialize all values.
func prepare(max_h: float, dam: float, crit_c: float, crit_d: float, arm: float, regen: float, ms: float) -> void:
	self.max_health = max_h
	self.current_health = max_h
	self.damage = dam
	self.crit_chance = crit_c
	self.crit_damage = crit_d
	self.armor = arm
	self.health_regen = regen
	self.movespeed = ms

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	process_health_regen(delta)
	pass

func process_health_regen(delta: float) -> void:
	if current_health < max_health:
		var healPerFrame = health_regen * delta
		if (current_health + healPerFrame >= max_health):
			current_health = max_health
		else:
			current_health += healPerFrame

func roll_crit() -> bool:
	return rng.randf() < crit_chance
