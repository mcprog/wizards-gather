class_name ManaComponent extends Node2D


@onready var attack_timer: Timer = $AttackTimer
@onready var special_timer: Timer = $SpecialTimer

@export_subgroup("Stats", "mc")
@export var current_mana : float
@export var max_mana : float
## Tha attack speed is represented as attacks/second. So 0.5 attack speed = 2 seconds per attack
@export var attack_speed : float
@export var mana_per_attack : float

func prepare(m_mana: float, aspeed : float, m_regen: float) -> void:
	self.current_mana = m_mana
	self.max_mana = m_mana
	self.attack_speed = aspeed
	self.mana_regen = m_regen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attack_timer.start(get_attack_speed_as_duration())
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if current_mana >= max_mana:
		current_mana = 0
		#fire_special()

func get_attack_speed_as_duration() -> float:
	return 1 / attack_speed

func _on_attack_timer_timeout() -> void:
	attack_timer.start(get_attack_speed_as_duration())
	
	current_mana += mana_per_attack
	if current_mana >= max_mana:
		current_mana = 0
		fire_special()
	else:
		fire_attack()
