# Cannot have class name since it has autoload global name
extends Node

# Scenes
const MAIN_MENU = preload("res://ui/main_menu.tscn")
const GAME_ENTRY = preload("res://scenes/game.tscn")
const DEATH_MENU = preload("res://ui/death.tscn")

# World
const GAME_PX_HEIGHT = 648
const GAME_PX_WIDTH = 1152
const HALF_PX_PLAYER_HEIGHT = 52
const BOTTOM_PLATFORM_PX = 520

# Stats
const PLAYER_BASE_HEALTH = 200.0
const PLAYER_BASE_ARMOR =   40.0
const PLAYER_BASE_REGEN =    1.75	# HP/s

# Colors
const BASIC_DAMAGE_COLOR = Color.INDIAN_RED
const TRUE_DAMAGE_COLOR = Color.LIGHT_STEEL_BLUE
