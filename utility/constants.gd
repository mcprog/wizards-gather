# Cannot have class name since it has autoload global name
extends Node

# Fonts
const DEFAULT_FONT = preload("res://fonts/Beholden-Regular.ttf")

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
const PLAYER_BASE_ARMOR  =  40.0
const PLAYER_BASE_REGEN  =   1.75	# HP/s

# Icons
const BASE_CRIT_ICON = preload("res://textures/ui/damage_number/crit_icon_base.png")
const PURE_CRIT_ICON = preload("res://textures/ui/damage_number/crit_icon_pure.png")

# Colors
const BASIC_DAMAGE_COLOR = Color.FLORAL_WHITE
const PURE_DAMAGE_COLOR = Color.LIGHT_STEEL_BLUE
const CRIT_DAMAGE_COLOR = Color.INDIAN_RED
