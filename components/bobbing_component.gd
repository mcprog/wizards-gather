class_name BobbingComponent extends Node2D


@export_subgroup("Settings")
@export var amplitude = 10.0
@export var speed = 3.0

var time = 0.0
var initial_y = 0

func prepare(node: Node2D):
	initial_y = node.position.y

func handle_bobbing(node: Node2D, delta: float):
	time += delta * speed
	var py = sin(time) * amplitude
	
	node.position.y = initial_y + py
	
