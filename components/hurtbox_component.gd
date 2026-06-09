class_name HurtboxComponent extends Area2D

@export_subgroup("Nodes")
@export var health_component: HealthComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(health_component)

func apply_status_effect(effect: HitData.HitEffect, stacks: int) -> void:
	match effect:
		HitData.HitEffect.BURN:
			print_debug("TODO apply burn")
		HitData.HitEffect.BLEED:
			print_debug("TODO apply bleed")
		_:
			print_debug("TODO other status effects")

func recieve_hit(hit: HitData) -> void:
	health_component.take_damage(hit.damage_position, hit.damage, hit.is_crit, hit.is_pure)
	for status_effect in hit.on_hit_effects:
		var stacks = hit.on_hit_effects[status_effect]
		apply_status_effect(status_effect, stacks)
	
