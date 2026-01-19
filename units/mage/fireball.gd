class_name Fireball extends Node2D


@onready var hitbox = $Hitbox

#var burn_effect_scene = load("res://sources/characters/mage/burn.tscn")
#var explosion_scene = load("res://sources/characters/mage/fireball_explosion.tscn")

var direction: Vector2 = Vector2.ZERO
var speed: float = 100

var damage = 0
var crit = false


func prepare(dir: Vector2, dmg: float, is_crit: bool) -> void:
	self.direction = dir
	self.damage = dmg
	self.crit = is_crit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	look_at(direction)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position += direction.normalized() * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.
