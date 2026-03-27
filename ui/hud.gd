class_name HUD extends Control

@onready var unit_panel_1: UnitPanel = $HBoxContainer/UnitPanel1
@onready var unit_panel_2: UnitPanel = $HBoxContainer/UnitPanel2
@onready var unit_panel_3: UnitPanel = $HBoxContainer/UnitPanel3
@onready var unit_panel_4: UnitPanel = $HBoxContainer/UnitPanel4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func prepare(unit1: UnitHolder.UnitType, unit2: UnitHolder.UnitType, unit3: UnitHolder.UnitType, unit4: UnitHolder.UnitType):
	if unit1 == UnitHolder.UnitType.NONE:
		return
	unit_panel_1.show()
	unit_panel_1.prepare(UnitHolder.get_unit_name(unit1))
	if unit2 == UnitHolder.UnitType.NONE:
		return
	unit_panel_2.show()
	unit_panel_2.prepare(UnitHolder.get_unit_name(unit2))
	if unit3 == UnitHolder.UnitType.NONE:
		return
	unit_panel_3.show()
	unit_panel_3.prepare(UnitHolder.get_unit_name(unit3))
	if unit4 == UnitHolder.UnitType.NONE:
		return
	unit_panel_4.show()
	unit_panel_4.prepare(UnitHolder.get_unit_name(unit4))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
