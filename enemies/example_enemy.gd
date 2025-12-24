class_name ExampleEnemy extends BaseEnemy


@export_subgroup("Nodes")
@onready var animation_component: AnimationComponent = $AnimationComponent

@onready var statistics: UnitStatistics = $UnitStatistics
@onready var sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_component.play_move_animation()
	statistics.prepare(80.0, 8.0, 0.01, 1.75, 0.0, 0.33, 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass
