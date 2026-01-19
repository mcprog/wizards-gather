class_name HealthComponent extends Node2D


@onready var numbers_popup: PackedScene = preload("res://ui/damage_number_popup.tscn")

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

## Handles health regeneration per tick
func process_health_regen(delta: float) -> void:
	if current_health < max_health:
		# Multiply by delta to handle HP/s
		var heal_per_frame = health_regen * delta
		if (current_health + heal_per_frame >= max_health):
			current_health = max_health
		else:
			current_health += heal_per_frame

## Handles taking damage
func take_damage(dmg_pos: Vector2, raw_damage: float, is_crit: bool, is_pure: bool) -> void:
	## BASE_ARMOR_MODIFIER = 100 means   |  BASE_ARMOR_MODIFIER = 200 means
	## 50  Armor = 33% damage reduction  |  50  Armor = 20% damage reduction
	## 100 Armor = 50% damage reduction  |  100 Armor = 33% damage reduction
	## 200 Armor = 66% damage reduction  |  200 Armor = 50% damage reduction
	## 300 Armor = 75% damage reduction  |  300 Armor = 60% damage reduction
	var final_damage = raw_damage
	if not is_pure:	final_damage = raw_damage * (Constants.BASE_ARMOR_MODIFIER / (armor + Constants.BASE_ARMOR_MODIFIER))
	current_health -= final_damage
	print_debug(final_damage)
	
	# Spawn damage numbers popup
	var numbers_obj = numbers_popup.instantiate()
	numbers_obj.prepare(dmg_pos, final_damage, is_crit, is_pure)
	get_tree().root.add_child(numbers_obj)

	if current_health <= 0.0:
		if get_parent().is_in_group(Constants.PLAYER_GLOBAL_GROUP_STRING):
			get_tree().change_scene_to_packed(Constants.DEATH_MENU)
		else:
			# Handle enemy death using get_parent()
			pass
