class_name PickupComponent extends Area2D

var can_pickup = false


func _on_area_entered(area: Area2D) -> void:
	can_pickup = true


func _on_area_exited(area: Area2D) -> void:
	can_pickup = false
