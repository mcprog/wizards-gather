class_name Coin extends Node2D

@export_subgroup("Nodes")
@export var pickup_component: PickupComponent

@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	sprite.play(sprite.animation)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pickup_component.can_pickup:
		queue_free()
		# TODO add acutal pickup effects
