class_name AttackComponent extends Node2D


@onready var range_area: Area2D = $RangeArea
@onready var range_area_collider: CircleShape2D = $RangeArea/CollisionShape2D.shape

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

var has_max_mana: bool = false
## Targeting variables
var has_target: bool = false
var target: Node2D = null

var rng = RandomNumberGenerator.new()

func prepare(dam: float, crit_c: float, crit_d: float, mana: float, attacks_per_second: float, mana_per_second: float, range_in: float) -> void:
	self.damage = dam
	self.crit_chance = crit_c
	self.crit_damage = crit_d
	self.max_mana = mana
	self.current_mana = mana
	self.attack_speed = attacks_per_second
	self.mana_regen = mana_per_second
	## Set range for unit
	range_area_collider.radius = range_in


func _ready() -> void:
	pass # Replace with function body.


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




func roll_crit() -> bool:
	return rng.randf() < crit_chance
	

func get_attack_speed_as_duration() -> float:
	return 1.0 / attack_speed


func reset_manabar() -> void:
	current_mana = 0


func select_target() -> Node2D:
	for area in range_area.get_overlapping_areas():
		if area.owner.is_in_group("enemy") and area.is_in_group("hurtbox"):
			return area.owner
	return null
