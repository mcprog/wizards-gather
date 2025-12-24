class_name ExampleEnemy extends BaseEnemy


func _ready() -> void:
	self.statistics.prepare(100.0, 10.0, 0.01, 1.75, 25.0, 0.33, 20.0)


func _process(_delta: float) -> void:
	pass


func _physics_process(_delta: float) -> void:
	pass
