class_name InputComponent extends Node2D



var clicked = false
var click_position: Vector2 = Vector2.ZERO
var direction_x = 0.0
var down_jump = false
var jump = false


func handle_input():
	if not clicked and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		clicked = true
		click_position = get_global_mouse_position()
	elif not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		clicked = false
		
	direction_x = Input.get_axis("left", "right")
	
	down_jump = Input.is_action_pressed("down")
	jump = Input.is_action_pressed("jump")
	
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_packed(Constants.MAIN_MENU)

func spawn_cursor(cursor: WandCursor) -> bool:
	if clicked:
		cursor.position = click_position
		cursor.start()
		return true
	return false
