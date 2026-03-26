class_name PauseMenu extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		if get_tree().paused:
			get_tree().paused = false
			hide()
		else:
			get_tree().paused = true
			show()

func _on_quit_dark_button_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(Constants.MAIN_MENU)


func _on_resume_dark_button_button_up() -> void:
	get_tree().paused = false
	hide()
