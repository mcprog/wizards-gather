class_name DummyPlayer extends Player

@export_subgroup("Settings")
@export var start_animation: Player.PlayerAnimation

func _ready() -> void:
	if start_animation == PlayerAnimation.RUN:
		animation_component.play_move_animation()
	elif start_animation == PlayerAnimation.JUMP:
		animation_component.play_animation("jump")
	elif start_animation == PlayerAnimation.HURT:
		animation_component.play_animation("hurt")

func _physics_process(delta: float) -> void:
	pass
