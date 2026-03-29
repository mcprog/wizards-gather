class_name MageUnit extends Node2D


@onready var fireball_obj = preload("res://units/mage/fireball.tscn")

@export_subgroup("Components")
@export var animation_component: AnimationComponent
@export var attack_component: AttackComponent
@export var health_component: HealthComponent

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var attack_timer: Timer = $AttackTimer

var is_attacking: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()
	attack_component.prepare(15.0, 0.01, 1.75, 30.0, 0.8, 1.5)
	health_component.prepare(50.0, 10.0, 0.2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_rotation = 0.0
	if attack_component.has_target and not is_attacking:
			if attack_component.has_max_mana:
				fire_special(attack_component.target)
			else:
				fire_attack(attack_component.target)

# Should return this array: [current_health, max_health, armor, health_regen, damage, crit_chance, crit_damage, max_mana, current_mana, attack_speed, mana_regen]
func get_stats():
	var health_stats = health_component.get_stats()
	var attack_stats = attack_component.get_stats()	
	return health_stats + attack_stats

func fire_attack(target: Node2D) -> void:
	var fireball: Fireball = fireball_obj.instantiate()
	fireball.prepare(attack_component.target.position - self.position, attack_component.damage, attack_component.roll_crit())
	get_tree().root.add_child(fireball)
	# Set attack speed timer and flag
	attack_timer.start(attack_component.get_attack_speed_as_duration())
	is_attacking = true

	
func fire_special(_target: Node2D) -> void:
	attack_component.reset_manabar()


func _on_attack_timer_timeout() -> void:
	is_attacking = false
