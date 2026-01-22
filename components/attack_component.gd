class_name AttackComponent extends Area2D

@export_subgroup("Stats", "ac")
@export var damage : float
## The crit chance of the unit. This should be a float on a scale from 0 - 1.
@export var crit_chance : float
@export var crit_damage : float
@export var current_mana : float
@export var max_mana : float
## The attack speed, represented as attacks/second.
## Example: 0.5 attack speed => 2 seconds per attack
@export var attack_speed : float
@export var mana_regen : float

@export_subgroup("Nodes", "ac")
@export var shape: CollisionShape2D

var has_max_mana: bool = false
## Targeting variables
var has_target: bool = false
var target: Node2D = null

var rng = RandomNumberGenerator.new()


## Prepare the component statistics for the unit. This must be called on the unit's _ready()
func prepare(dam: float, crit_c: float, crit_d: float, mana: float, attacks_per_second: float, mana_per_second: float) -> void:
	self.damage = dam
	self.crit_chance = crit_c
	self.crit_damage = crit_d
	self.max_mana = mana
	self.current_mana = mana
	self.attack_speed = attacks_per_second
	self.mana_regen = mana_per_second
	# range is now set up size of required collider


func _process(delta: float) -> void:
	process_targeting()
	process_mana_regen(delta)


## Attempts to select target for the unit attached
func process_targeting() -> void:
	if target == null:
		target = select_target()
	# Set has_target bool
	has_target = (target != null)


## Process mana regen per frame. Handles has_max_mana variable
func process_mana_regen(delta: float) -> void:
	if current_mana < max_mana:
		# Multiply by delta to handle Mana/s
		var mana_per_frame = mana_regen * delta
		if (current_mana + mana_per_frame >= max_mana):
			current_mana = max_mana
			has_max_mana = true
		else:
			current_mana += mana_per_frame


## Rolls crit based on component's crit chance
func roll_crit() -> bool:
	return rng.randf() < crit_chance

	
## Returns attack speed as a duration to be used in timer.start(_) 
func get_attack_speed_as_duration() -> float:
	return 1.0 / attack_speed


func reset_manabar() -> void:
	current_mana = 0


func select_target() -> Node2D:
	for area in get_overlapping_areas():
		if area.is_in_group("enemy") and area.is_in_group("hurtbox"):
			return area.owner
	return null
