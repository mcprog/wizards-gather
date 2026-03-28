class_name UnitPanel extends PanelContainer

@export_subgroup("Settings")
@export var portrait_texture: Texture2D

@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect
@onready var health_progress_bar: ProgressBar = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/HealthProgressBar
@onready var mana_progress_bar: ProgressBar = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/ManaProgressBar
@onready var unit_name_label: Label = $MarginContainer/VBoxContainer/UnitNameLabel
@onready var health_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/HealthProgressBar/HealthLabel
@onready var mana_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/StatsContainer/ManaProgressBar/ManaLabel

const ANIMATION_DURATION = 1.5

# animate to these values (interpolation)
var target_max_health: float
var target_health: float
var damage: float
var cit_chance: float
var mana_regen: float

var health_tween: Tween
var mana_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(portrait_texture)
	texture_rect.texture = portrait_texture

func prepare(name):
	unit_name_label.text = name
	

func set_values(max_health: float, health: float, damage: float, crit_chance: float, mana_regen: float):
	target_max_health = max_health
	target_health = health
	self.damage = damage
	self.cit_chance = crit_chance
	self.mana_regen = mana_regen
	
	# health progress bar
	health_progress_bar.max_value = target_health
	health_label.text = "%.0f/%.0f" % [health, max_health]
	if abs(target_health - health_progress_bar.value) > Constants.E:
		if health_tween:
			health_tween.kill()
		health_tween = create_tween()
		health_tween.tween_property(health_progress_bar, "value", target_health, ANIMATION_DURATION)
	
	mana_label.text = "%.1f/s" % mana_regen 
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
