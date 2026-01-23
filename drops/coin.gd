class_name Coin extends Node2D

@export_subgroup("Nodes")
@export var pickup_component: PickupComponent
@export var bobbing_component: BobbingComponent

@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	sprite.play(sprite.animation)
	bobbing_component.prepare(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bobbing_component.handle_bobbing(self, delta)
	if pickup_component.can_pickup:
		SoundManager.play_coin_pickup()
		queue_free()
