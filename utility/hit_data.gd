class_name HitData

# Some status effect ommited since they will never be applied from an attack
enum HitEffect {
	BURN,
	BLEED,
	STAGGER,
	SLOW,
	STUN,
	CRIPPLE,
	EXECUTE
}

var damage_position: Vector2
var damage: float
var is_crit: bool
var is_pure: bool
var on_hit_effects: Dictionary = {}
