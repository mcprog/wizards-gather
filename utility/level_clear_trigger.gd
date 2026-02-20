class_name LevelClearTrigger extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print_debug("player body entered level clear trigger. changing scene.")
	get_tree().change_scene_to_packed(Constants.SHOP_MENU)
