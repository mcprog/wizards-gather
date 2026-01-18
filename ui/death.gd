class_name Death extends Control

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_packed(Constants.MAIN_MENU)


func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_packed(Constants.GAME_ENTRY)
