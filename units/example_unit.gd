class_name ExampleUnit extends BaseUnit


func _ready() -> void:
	self.statistics.prepare(150.0, 15.0, 0.01, 1.75, 20.0, 1.33, 33)


func _process(_delta: float) -> void:
	pass


func _physics_process(_delta: float) -> void:
	pass
