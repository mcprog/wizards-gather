class_name UnitPanel extends PanelContainer

@export_subgroup("Settings")
@export var portrait_texture: Texture2D

@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(portrait_texture)
	texture_rect.texture = portrait_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
