class_name UnitPanel extends PanelContainer

@export_subgroup("Settings")
@export var portrait_texture: Texture2D

@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect
@onready var health_progress_bar: ProgressBar = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/HealthProgressBar
@onready var mana_progress_bar: ProgressBar = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/ManaProgressBar
@onready var unit_name_label: Label = $MarginContainer/VBoxContainer/UnitNameLabel
@onready var health_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/HealthProgressBar/HealthLabel
@onready var mana_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/ManaProgressBar/ManaLabel
@onready var damage_value_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/StatsLineItemDamage/DamageValueLabel
@onready var crit_chance_value_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/StatsLineItemCritChance/CritChanceValueLabel
@onready var crit_damage_value_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/StatsLineItemCritDamage/CritDamageValueLabel

const ANIMATION_DURATION = 1.5

# animate to these values (interpolation)
var target_max_health: float
var target_health: float
var damage: float
var crit_chance: float
var crit_damage: float
var mana_regen: float
var target_max_mana: float
var target_mana: float

var health_tween: Tween
var mana_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(portrait_texture)
	texture_rect.texture = portrait_texture

func prepare(name):
	unit_name_label.text = name
	

func set_values(max_health: float, health: float, damage: float, crit_chance: float, crit_damage: float, mana_regen: float, max_mana: float, current_mana: float):
	target_max_health = max_health
	target_health = health
	self.damage = damage
	self.crit_chance = crit_chance
	self.crit_damage = crit_damage
	self.mana_regen = mana_regen
	target_mana = current_mana
	target_max_mana = max_mana
	
	# health progress bar
	health_progress_bar.max_value = target_health
	health_label.text = "%.0f/%.0f" % [health, max_health]
	if abs(target_health - health_progress_bar.value) > Constants.E:
		if health_tween:
			health_tween.kill()
		health_tween = create_tween()
		health_tween.tween_property(health_progress_bar, "value", target_health, ANIMATION_DURATION)
	
	# mana progress bar
	mana_progress_bar.max_value = target_max_mana
	mana_label.text = "%.1f/s" % mana_regen 
	if abs(target_mana - mana_progress_bar.value) > Constants.E:
		if mana_tween:
			mana_tween.kill()
		mana_tween = create_tween()
		mana_tween.tween_property(mana_progress_bar, "value", target_mana, ANIMATION_DURATION)
	
	# setting other stat values
	damage_value_label.text = "%.1f" % damage
	crit_chance_value_label.text = "%.1f%%" % (crit_chance * 100.0)
	crit_damage_value_label.text = "%.1fx" % crit_damage
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
