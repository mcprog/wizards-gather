class_name HealthComponent extends Node2D

@export_subgroup("Stats", "hc")
@export var current_health : float
@export var max_health : float
@export var armor : float
@export var health_regen : float

## Call this function to initialize all values
func prepare(max_h: float, arm: float, regen: float) -> void:
	self.max_health = max_h
	self.current_health = max_h
	self.armor = arm
	self.health_regen = regen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	process_health_regen(delta)
	pass

## Handles health regeneration per tick
func process_health_regen(delta: float) -> void:
	if current_health < max_health:
		# Multiply by delta to handle HP/s
		var healPerFrame = health_regen * delta
		if (current_health + healPerFrame >= max_health):
			current_health = max_health
		else:
			current_health += healPerFrame

## Handles taking damage
func take_damage(raw_damage: float) -> void:
	var BASE_ARMOR_MODIFIER = 100
	## BASE_ARMOR_MODIFIER = 100 means   |  BASE_ARMOR_MODIFIER = 200 means
	## 50  Armor = 33% damage reduction  |  50  Armor = 20% damage reduction
	## 100 Armor = 50% damage reduction  |  100 Armor = 33% damage reduction
	## 200 Armor = 66% damage reduction  |  200 Armor = 50% damage reduction
	## 300 Armor = 75% damage reduction  |  300 Armor = 60% damage reduction
	var mitigated_damage = raw_damage * (BASE_ARMOR_MODIFIER / armor + BASE_ARMOR_MODIFIER)
	if current_health - mitigated_damage <= 0.0:
		## Handle player death
		pass
	else:
		current_health -= mitigated_damage
