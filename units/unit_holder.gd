class_name UnitHolder extends Node2D


@export_subgroup("Settings")
@export var rotation_speed: float = 150.0

@export_subgroup("Nodes")
@export var player: Player
@export var spawn1: PackedScene
@export var spawn2: PackedScene
@export var spawn3: PackedScene
@export var spawn4: PackedScene

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var unit1
var unit2
var unit3
var unit4

var unit1_type: UnitType
var unit2_type: UnitType
var unit3_type: UnitType
var unit4_type: UnitType

signal setup_complete

enum UnitType {
	MAGE,
	SHIFTER,
	CLERIC,
	DWARF,
	OCCULTIST,
	BARD,
	MONK,
	TEMPLAR,
	HIGH_ELF,
	NONE
}

static func get_unit_name(unit: UnitType):
	match (unit):
		UnitType.MAGE:
			return "Mage"
		UnitType.SHIFTER:
			return "Shifter"
		UnitType.CLERIC:
			return "Cleric"
		UnitType.DWARF:
			return "Dwarf"
		UnitType.OCCULTIST:
			return "Occultist"
		UnitType.BARD:
			return "Bard"
		UnitType.MONK:
			return "Monk"
		UnitType.TEMPLAR:
			return "Templar"
		UnitType.HIGH_ELF:
			return "High Elf"
	return "none"	
	
func determine_unit_type(scene: PackedScene) -> UnitType:
	var path = scene.resource_path
	print_debug("Scene path is: " + path)
	match path.get_file().get_basename():
		"mage_unit":
			print_debug("setting unit type to Mage")
			return UnitType.MAGE
	return UnitType.NONE
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rect = collision_shape_2d.shape.get_rect()
	if spawn1:
		var s = spawn1.instantiate()
		s.position = rect.position
		collision_shape_2d.add_child(s)
		unit1 = s
		unit1_type = determine_unit_type(spawn1)
	if spawn2:
		var s = spawn2.instantiate()
		s.position = Vector2(rect.end.x, rect.position.y)
		collision_shape_2d.add_child(s)
		unit2 = s
		unit2_type = determine_unit_type(spawn2)
	if spawn3:
		var s = spawn3.instantiate()
		s.position = Vector2(rect.position.x, rect.end.y)
		collision_shape_2d.add_child(s)
		unit3 = s
		unit3_type = determine_unit_type(spawn3)
	if spawn4:
		var s = spawn4.instantiate()
		s.position = rect.end
		collision_shape_2d.add_child(s)
		unit4 = s
		unit4_type = determine_unit_type(spawn4)
	
	emit_signal("setup_complete")


func _physics_process(delta: float) -> void:
	position = player.position
	rotation_degrees += rotation_speed * delta
