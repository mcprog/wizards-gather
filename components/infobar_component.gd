class_name InfobarComponent extends Node2D

@onready var health_bar = $HealthBar
@onready var mana_bar = $ManaBar

var ac_ref: AttackComponent = null
var hc_ref: HealthComponent = null

func prepare(ac_in: AttackComponent, hc_in: HealthComponent) -> void:
	if ac_in == null and hc_in == null: queue_free()
	self.ac_ref = ac_in
	self.hc_ref = hc_in
	if ac_ref: mana_bar.min_value = 0
	if hc_ref: health_bar.min_value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Delete node if both components are null
	if ac_ref: 
		mana_bar.max_value = ac_ref.max_mana
		mana_bar.value = ac_ref.current_mana
	if hc_ref: 
		health_bar.max_value = hc_ref.max_health
		health_bar.value = hc_ref.current_health

	if health_bar.value == health_bar.max_value:
		health_bar.hide()
	else:
		health_bar.show()
