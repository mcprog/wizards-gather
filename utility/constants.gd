# Cannot have class name since it has autoload global name
extends Node

# Scenes
const MAIN_MENU = preload("res://ui/main_menu.tscn")

# Stats
const PLAYER_BASE_HEALTH = 200.0
const PLAYER_BASE_ARMOR =   40.0
const PLAYER_BASE_REGEN =    1.75	# HP/s

# Colors
const BASIC_DAMAGE_COLOR = Color.INDIAN_RED
const TRUE_DAMAGE_COLOR = Color.LIGHT_STEEL_BLUE
