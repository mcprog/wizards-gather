class_name Fireball extends Node2D


@onready var hitbox = $Hitbox

#var burn_effect_scene = load("res://sources/characters/mage/burn.tscn")
#var explosion_scene = load("res://sources/characters/mage/fireball_explosion.tscn")

var direction: Vector2 = Vector2.ZERO
var speed: float = 500

var hit_data: HitData

func prepare(dir: Vector2, dmg: float, is_crit: bool) -> void:
	direction = dir.normalized()
	rotation = direction.angle()
	hit_data = HitData.new()
	hit_data.damage = dmg
	hit_data.is_crit = is_crit
	hit_data.on_hit_effects = { HitData.HitEffect.BURN: 1 }

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		hit_data.damage_position = position
		area.recieve_hit(hit_data)
		queue_free()
