@tool
class_name DualSprite extends Sprite2D

@export_subgroup("Settings")
@export_enum("A", "B") var type: int = 0:
	set(value):
		type = value
		_update_sprite()
@export var texture_a: Texture2D
@export var texture_b: Texture2D

func _ready() -> void:
	_update_sprite()


func _update_sprite():
	texture = texture_a if type == 0 else texture_b
