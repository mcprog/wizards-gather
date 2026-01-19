class_name DamageNumberPopup extends Node2D


@onready var text_label: RichTextLabel = $RichTextLabel
@onready var life_timer: Timer = $LifeTimer

const LIFE_DURATION = 0.9
const SPEED = 4

var rng = RandomNumberGenerator.new()
var text_color = Color.BLACK
var text_info = ""
var crit_img = null

func _ready() -> void:
	self.position += Vector2(rng.randf() * 5, rng.randf() * 5)
	text_label.text = " "
	text_label.add_theme_font_override("normal_font", Constants.DEFAULT_FONT)
	text_label.add_theme_font_size_override("normal_font_size", 16)
	text_label.add_theme_color_override("default_color", text_color)
	text_label.add_theme_color_override("font_outline_color", Color.BLACK)
	text_label.add_theme_constant_override("outline_size", 2)
	if crit_img != null:
		text_label.add_image(crit_img, 8, 8)
	text_label.append_text(text_info)
	life_timer.start(LIFE_DURATION)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2(rng.randf() * 3, -1)
	position += direction.normalized() * SPEED * delta


func set_params(pos: Vector2, value: int, is_crit: bool = false, is_pure: bool = false) -> void:
	text_info = str(value)
	if is_pure:
		if is_crit: crit_img = Constants.PURE_CRIT_ICON
		text_color = Constants.PURE_DAMAGE_COLOR
	else:
		if is_crit: crit_img = Constants.BASE_CRIT_ICON
		text_color = Constants.BASIC_DAMAGE_COLOR
	
	self.position = pos


func _on_life_timer_timeout() -> void:
	queue_free()
