class_name InputComponent extends Node2D



var clicked = false
var click_position: Vector2 = Vector2.ZERO


func handle_input():
	if not clicked and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		clicked = true
		click_position = get_global_mouse_position()
	elif not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		clicked = false
	
	if Input.is_action_just_pressed("escape"):
		print_debug("Escape was pressed")
		get_tree().change_scene_to_packed(Constants.MAIN_MENU)

func spawn_cursor(cursor: WandCursor) -> bool:
	if clicked:
		cursor.position = click_position
		cursor.start()
		return true
	return false
