class_name AnimationComponent extends Node2D

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D

var direction = 1.0
var jumping = false

func play_move_animation():
	sprite.play("run")

func play_animation(animation: String):
	sprite.play(animation)

func handle_animation(direction_x: float, is_on_floor, vy: float):
	if direction != direction_x:
		direction = direction_x
		sprite.flip_h = direction < 0
	if is_on_floor:
		play_move_animation()
	else:
		if vy < 0:
			sprite.play("jump")
		else:
			sprite.play("fall")
