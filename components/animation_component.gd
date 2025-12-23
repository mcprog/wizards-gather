class_name AnimationComponent extends Node2D

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D

func play_move_animation():
	sprite.play("run")
